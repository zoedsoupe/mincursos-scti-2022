defmodule Greeting do
  def hello(%{name: name}) do
    "Fala, #{name}"
  end

  def hello(%{last_name: last}) do
    "Fala, Sra #{last}"
  end
end
