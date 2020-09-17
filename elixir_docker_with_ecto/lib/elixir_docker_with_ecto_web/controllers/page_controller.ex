defmodule ElixirDockerWithEctoWeb.PageController do
  use ElixirDockerWithEctoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
