defmodule Main do
  require Logger
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    Logger.debug("[Main Application] Started") 
    children = [
      # Define workers and child supervisors to be supervised
      # worker(Main.Worker, [arg1, arg2, arg3])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Main.Supervisor]
    out = Supervisor.start_link(children, opts)
    :net_kernel.allow(:"alt@127.0.0.1")
    Logger.debug("[Main Application] Ready") 
    out
  end
end
