defmodule BasicChatWeb.Live.Index do
  use Phoenix.LiveView

  alias BasicChat.Chat.Message

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  defp fetch(socket, user_name \\ nil) do
    messages = Message.list_messages()
    assign(socket, %{user_name: user_name, messages: messages})
  end
end