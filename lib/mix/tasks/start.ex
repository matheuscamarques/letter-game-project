defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    Letter.HandleGame.call()
  end
end
