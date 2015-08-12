defmodule Util.App do
  use Application
  require Logger
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    Logger.debug("[Util Application] Started") 
    children = [ worker(Util.Server, []) ]
    opts = [strategy: :one_for_one, name: Util.Supervisor]
    out = Supervisor.start_link(children, opts)
    Logger.debug("[Util Application] Ready") 
    out
  end
end
