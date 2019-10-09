defmodule BasicChatWeb.Live.Index do
  use Phoenix.LiveView

  alias BasicChat.Chat
  alias BasicChatWeb.ChatView

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    ChatView.render("index.html", assigns)
  end

  defp fetch(socket, user_name \\ nil) do
    messages = Chat.list_messages()
    assign(socket, %{user_name: user_name, messages: messages})
  end
end