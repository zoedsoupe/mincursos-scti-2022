defmodule Stupid do
  def say(msg) do
    IO.puts msg
    :timer.sleep(500)
    say(msg)
  end

  def loop do
    spawn fn -> say("UMA MENSAGEM") end
    spawn fn -> say("OUTRA MENSAGEM") end
  end
end
