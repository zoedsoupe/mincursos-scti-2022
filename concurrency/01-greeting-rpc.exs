defmodule Greeting do
  def say(msg) do
    "Hello #{msg}, from #{Node.self}"
  end
end
