# hit-counter

[![Actions Status](https://github.com/kutyel/hit-counter/workflows/Haskell%20CI/badge.svg)](https://github.com/kutyel/hit-counter/actions)
[![ormolu](https://img.shields.io/badge/styled%20with-ormolu-blueviolet)](https://github.com/tweag/ormolu)

Example Web Hit Counter with Scotty and Monad Transformers!

## Usage

First, start running the app:

```
*Main> :main lol
Setting phasers to stun... (port 3000) (ctrl-c to quit)
```

Then, on a different terminal, start hitting those URLs!

```sh
$ curl localhost:3000/woot
<h1>Success! Count was: 1</h1>
$ curl localhost:3000/woot
<h1>Success! Count was: 2</h1>
$ curl localhost:3000/blah
<h1>Success! Count was: 1</h1>
```
