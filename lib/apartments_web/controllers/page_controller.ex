defmodule ApartmentsWeb.PageController do
  use ApartmentsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
