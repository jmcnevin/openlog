defmodule Openlog.Message do
  use Openlog.Web, :model

  schema "messages" do
    field :body, :string
    field :occurred_at, Ecto.DateTime
    belongs_to :log, Openlog.Log, foreign_key: :log_id
    timestamps
  end

  @required_fields ~w(body occurred_at log_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
