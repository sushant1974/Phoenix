defmodule SchoolWeb.PageController do
  use SchoolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
