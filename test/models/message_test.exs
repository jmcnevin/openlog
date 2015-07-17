defmodule Openlog.MessageTest do
  use Openlog.ModelCase

  alias Openlog.Message

  @valid_attrs %{body: "some content", occurred_at: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, received_at: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
