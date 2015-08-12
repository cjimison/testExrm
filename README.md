TestExrm
========

This sample application was developed to help fix an issue with exrm.

The sample is broken down into 2 main release applications and one support application.  This test uses distributed erlang.


Application "util":

This is a simple elixir app that will startup a single global GenServer that will log a given text string.  It also has an interface module (called Util) that wraps the GenServer cast.

Application "main":

This application will run both the "util" application as well as the "alt" application.

Application "alt":

This is a kind of "load balancing" application (if it really did anything) to the "util" application.


Running the Sample:
===================

Running the "main" Application:

```
cd apps/main
mix deps.get
mix deps.compile
mix compile
mix release
./rel/main/bin/console
```

NOTE:  In this verison you will see that although "util" was directly added as an application in the mix.exs it is not started
because "alt" is also included in the application list, an "alt" has "util" marked as an included_application

Running the "alt" Application:

open a different terminal shell

```
cd apps/alt
mix deps.get
mix deps.compile
mix release
./rel/alt/bin/console
```
in the elixir console:
```
Util.pring("hello")
```

You should see "hello" print in the shell running the "main" application if things worked correctly

