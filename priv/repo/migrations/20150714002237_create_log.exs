defmodule Openlog.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :name, :string
      timestamps
    end
  end
end
