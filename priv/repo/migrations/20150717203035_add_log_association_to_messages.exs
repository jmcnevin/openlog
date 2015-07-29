defmodule Openlog.Repo.Migrations.AddLogAssociationToMessages do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :log_id, :integer, null: false
    end
  end
end
