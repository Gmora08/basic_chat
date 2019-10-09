defmodule BasicChatWeb.Live.Index do
  use Phoenix.LiveView

  alias BasicChat.Chat
  alias BasicChat.Chat.Message
  alias BasicChatWeb.ChatView

  require Logger

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    ChatView.render("index.html", assigns)
  end

  def handle_event("send_msg", %{"msg" => params}, socket) do
    params
    |> Enum.into(%{"datetime" => DateTime.utc_now()})
    |> Chat.create_message()

    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    changeset = Chat.change_message(%Message{})
    messages = Chat.list_messages()
    assign(socket, messages: messages, changeset: changeset)
  end
end