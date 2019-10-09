defmodule BasicChat.Repo do
  use Ecto.Repo,
    otp_app: :basic_chat,
    adapter: Ecto.Adapters.Postgres
end
