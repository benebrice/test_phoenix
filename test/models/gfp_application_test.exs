defmodule GfpActivity.GfpApplicationTest do
  use GfpActivity.ModelCase

  alias GfpActivity.GfpApplication

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GfpApplication.changeset(%GfpApplication{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GfpApplication.changeset(%GfpApplication{}, @invalid_attrs)
    refute changeset.valid?
  end
end
