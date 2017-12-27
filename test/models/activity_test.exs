defmodule GfpActivity.ActivityTest do
  # use GfpActivity.ModelCase
  use ExUnit.Case

  alias GfpActivity.Activity
  

  @valid_attrs %{activity_from_id: "7488a646-e31f-11e4-aace-600308960662", activity_from_type: "some activity_from_type", activity_to_id: "7488a646-e31f-11e4-aace-600308960662", activity_to_type: "some activity_to_type", activity_type_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Activity.changeset(%Activity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Activity.changeset(%Activity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
