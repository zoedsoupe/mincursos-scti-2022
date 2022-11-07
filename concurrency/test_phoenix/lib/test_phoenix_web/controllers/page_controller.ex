defmodule TestPhoenixWeb.PageController do
  use TestPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", title: "Hey", message: "Hello there!")
  end
end
