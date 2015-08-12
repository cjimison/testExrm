TestExrm
========

This sample application was developed to help fix an issue with exrm.

The sample is broken down into 2 main release applications and one support application.  This test set uses distributed erlang.


Application Util:

This is a simple elixir app that will startup a single global GenServer that will log a given statement.  It also has an interface module (called Util) that wraps the GenServer cast.

Application Main:

This application will run bot the Util application as well as the Alt application.

Application Alt:

This is a kind of "load balancing" application.


Running the Sample:
===================

Running the Main Application:

cd apps/main
mix deps.get
mix deps.compile
mix compile
mix release
./rel/main/bin/console

NOTE:  In this verison you will see that although util was added as an application in the mix.exs it is not started
because this alt is also included in the application list, however alt has :util marked as an included_application

Running the Alt Application:

open a different terminal shell

cd apps/alt
mix deps.get
mix deps.compile
mix release
./rel/alt/bin/console

in the elixir console:

Util.pring("hello")

You should see "hello" print in the shell running the Main application
