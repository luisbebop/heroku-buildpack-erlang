<<<<<<< HEAD
### Hello world Erlang web app

To build and run:

    $ rebar get-deps compile
    $ foreman start
    19:11:36 web.1     | started with pid 54986
    19:11:36 web.1     | start web server on port 5000

    $ curl http://127.0.0.1:5000/
    Hello world from Erlang.

    ^CSIGINT received
    19:11:46 system    | terminating
    19:11:46 system    | killing web in pid 54986
    19:11:46 web.1     | process exiting
    19:11:46 web.1     | process terminated
    19:11:46 system    | terminating
=======
## Heroku buildpack: Erlang

This is a Heroku buildpack for Erlang apps. It uses [Rebar](https://github.com/basho/rebar).


### Usage

    $ git clone https://github.com/JacobVorreuter/hello-erlang.git
    $ cd hello-erlang
    $ heroku create test-erlang-app -s cedar
    $ heroku config:add BUILDPACK_URL=http://github.com/heroku/heroku-buildpack-erlang.git
    $ git push heroku master
    $ curl http://test-erlang-app.herokuapp.com/
>>>>>>> a7a046b0fe67d1fad0dd772f23ece6e78df24440
