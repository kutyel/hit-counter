# hit-counter
Example Web Hit Counter with Scotty and Monad Transformers

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
