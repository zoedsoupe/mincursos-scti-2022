defmodule Exemplo do
  def fala do
    receive do
      {:ok, msg} -> IO.puts msg
    end

    fala()
  end
end
