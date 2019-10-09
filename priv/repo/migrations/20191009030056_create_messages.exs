defmodule BasicChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :username, :string
      add :content, :string
      add :datetime, :utc_datetime

      timestamps()
    end

  end
end
