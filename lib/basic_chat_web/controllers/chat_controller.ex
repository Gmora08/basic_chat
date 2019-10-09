defmodule BasicChatWeb.ChatController do
  use BasicChatWeb, :controller
  alias BasicChatWeb.Live.Index, as: ChatLiveIndex

  def index(conn, _params) do
    live_render(conn, ChatLiveIndex, session: %{})
  end
end