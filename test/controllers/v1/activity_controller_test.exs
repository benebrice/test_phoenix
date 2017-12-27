defmodule GfpActivity.V1.ActivityControllerTest do
  # use GfpActivity.ConnCase
  use ExUnit.Case

  alias GfpActivity.Activity
  @valid_attrs %{activity_from_id: "7488a646-e31f-11e4-aace-600308960662", activity_from_type: "some activity_from_type", activity_to_id: "7488a646-e31f-11e4-aace-600308960662", activity_to_type: "some activity_to_type", activity_type_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_activity_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    activity = Repo.insert! %Activity{}
    conn = get conn, v1_activity_path(conn, :show, activity)
    assert json_response(conn, 200)["data"] == %{"id" => activity.id,
      "activity_from_id" => activity.activity_from_id,
      "activity_from_type" => activity.activity_from_type,
      "activity_to_id" => activity.activity_to_id,
      "activity_to_type" => activity.activity_to_type,
      "activity_type_id" => activity.activity_type_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, v1_activity_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_activity_path(conn, :create), activity: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Activity, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_activity_path(conn, :create), activity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    activity = Repo.insert! %Activity{}
    conn = put conn, v1_activity_path(conn, :update, activity), activity: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Activity, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    activity = Repo.insert! %Activity{}
    conn = put conn, v1_activity_path(conn, :update, activity), activity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    activity = Repo.insert! %Activity{}
    conn = delete conn, v1_activity_path(conn, :delete, activity)
    assert response(conn, 204)
    refute Repo.get(Activity, activity.id)
  end
end
