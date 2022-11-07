defmodule ExemploAgent do
  use Agent

  def start_link(init \\ 0) do
    Agent.start_link(fn -> init end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, & &1 + 1)
  end
end
