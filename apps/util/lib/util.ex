defmodule Util do
  
  require Logger

  def print(text) do
    case :global.whereis_name(:printer) do
      :undefined ->
        Logger.debug("Sorry but I could not find the printer")
      pid ->
        GenServer.cast(pid, {:print, text})
    end
  end
end
