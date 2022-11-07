defmodule Counter do
  def count(n) do
    receive do
      {:read, from} ->
        send(from, n)
        count(n + 1)
    end
  end
end
