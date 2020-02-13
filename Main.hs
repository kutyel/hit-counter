{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Class
import Control.Monad.Trans.Reader
import Data.IORef
import qualified Data.Map as M
import Data.Maybe (fromMaybe)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as TL
import System.Environment (getArgs)
import Web.Scotty.Trans

data Config
  = Config
      { counts :: IORef (M.Map Text Integer),
        prefix :: Text
      }

type Scotty = ScottyT Text (ReaderT Config IO)

bumpBoomp :: Text -> M.Map Text Integer -> (M.Map Text Integer, Integer)
bumpBoomp k m = (M.insert k bump m, bump)
  where
    bump = fromMaybe 0 (M.lookup k m) + 1

app :: Scotty ()
app =
  get "/:key" $ do
    unprefixed <- param "key"
    Config counts prefix <- lift ask
    let key' = prefix <> unprefixed
        map' = readIORef counts
    (newMap, newInteger) <- liftIO $ bumpBoomp key' <$> map'
    liftIO $ writeIORef counts newMap
    html $
      mconcat
        [ "<h1>Success! Count was: ",
          TL.pack $ show newInteger,
          "</h1>"
        ]

main :: IO ()
main = do
  [prefixArg] <- getArgs
  counter <- newIORef M.empty
  let config = Config counter (TL.pack prefixArg)
      runR = flip runReaderT config
  scottyT 3000 runR app
