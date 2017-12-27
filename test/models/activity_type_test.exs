defmodule GfpActivity.ActivityTypeTest do
  # use GfpActivity.ModelCase
  use ExUnit.Case

  alias GfpActivity.ActivityType

  @valid_attrs %{description: "some description", title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ActivityType.changeset(%ActivityType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ActivityType.changeset(%ActivityType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
