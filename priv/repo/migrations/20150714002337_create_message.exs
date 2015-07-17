defmodule Openlog.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :string
      add :occurred_at, :datetime
      timestamps
    end
  end
end
