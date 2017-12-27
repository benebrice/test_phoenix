defmodule GfpActivityWeb.PageController do
  use GfpActivityWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
