defmodule BasicChatWeb.Live.Index do
  use Phoenix.LiveView

  alias BasicChat.Chat
  # alias BasicChat.Chat.Message
  alias BasicChatWeb.ChatView

  require Logger

  def mount(_session, socket) do
    Chat.subscribe()
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    ChatView.render("index.html", assigns)
  end

  def handle_event("send_msg", %{"msg" => params}, socket) do
    params
    |> Enum.into(%{"datetime" => DateTime.utc_now()})
    |> Chat.create_message()

    {:noreply, fetch(socket, params["username"])}
  end

  def handle_info({Chat, [:message, _event_type], _message}, socket) do
    {:noreply, fetch(socket, get_username(socket))}
  end

  defp fetch(socket, username \\ nil) do
    messages = Chat.list_messages()
    assign(socket, messages: messages, username: username)
  end

  defp get_username(socket) do
    socket.assigns.username
  end
end