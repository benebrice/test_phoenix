defmodule GfpActivity.V1.ActivityTypeControllerTest do
  # use GfpActivity.ConnCase
  use ExUnit.Case

  alias GfpActivity.ActivityType
  @valid_attrs %{description: "some description", title: "some title"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_activity_type_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    activity_type = Repo.insert! %ActivityType{}
    conn = get conn, v1_activity_type_path(conn, :show, activity_type)
    assert json_response(conn, 200)["data"] == %{"id" => activity_type.id,
      "title" => activity_type.title,
      "description" => activity_type.description}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, v1_activity_type_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_activity_type_path(conn, :create), activity_type: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ActivityType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_activity_type_path(conn, :create), activity_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    activity_type = Repo.insert! %ActivityType{}
    conn = put conn, v1_activity_type_path(conn, :update, activity_type), activity_type: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ActivityType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    activity_type = Repo.insert! %ActivityType{}
    conn = put conn, v1_activity_type_path(conn, :update, activity_type), activity_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    activity_type = Repo.insert! %ActivityType{}
    conn = delete conn, v1_activity_type_path(conn, :delete, activity_type)
    assert response(conn, 204)
    refute Repo.get(ActivityType, activity_type.id)
  end
end
