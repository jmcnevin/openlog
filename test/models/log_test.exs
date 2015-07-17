defmodule Openlog.LogTest do
  use Openlog.ModelCase

  alias Openlog.Log

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Log.changeset(%Log{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Log.changeset(%Log{}, @invalid_attrs)
    refute changeset.valid?
  end
end
