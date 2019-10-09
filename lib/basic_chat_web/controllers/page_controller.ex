defmodule BasicChatWeb.PageController do
  use BasicChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
