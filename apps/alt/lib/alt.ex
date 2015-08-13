defmodule Alt do
  use Application
  require Logger
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    Logger.debug("[Alt Application] Started") 

    opts = [strategy: :one_for_one, name: Alt.Supervisor]
    out = Supervisor.start_link([], opts)

    true = :net_kernel.connect_node(:"main@127.0.0.1")
    Logger.debug("[Alt Application] Ready") 
    out
  end
end
