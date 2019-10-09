defmodule BasicChat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :datetime, :utc_datetime
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:username, :content, :datetime])
    |> validate_required([:username, :content, :datetime])
  end
end
