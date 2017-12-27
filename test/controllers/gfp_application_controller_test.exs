defmodule GfpActivity.GfpApplicationControllerTest do
  use GfpActivity.ConnCase

  alias GfpActivity.GfpApplication
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gfp_application_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing gfp applications"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gfp_application_path(conn, :new)
    assert html_response(conn, 200) =~ "New gfp application"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gfp_application_path(conn, :create), gfp_application: @valid_attrs
    gfp_application = Repo.get_by!(GfpApplication, @valid_attrs)
    assert redirected_to(conn) == gfp_application_path(conn, :show, gfp_application.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gfp_application_path(conn, :create), gfp_application: @invalid_attrs
    assert html_response(conn, 200) =~ "New gfp application"
  end

  test "shows chosen resource", %{conn: conn} do
    gfp_application = Repo.insert! %GfpApplication{}
    conn = get conn, gfp_application_path(conn, :show, gfp_application)
    assert html_response(conn, 200) =~ "Show gfp application"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, gfp_application_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gfp_application = Repo.insert! %GfpApplication{}
    conn = get conn, gfp_application_path(conn, :edit, gfp_application)
    assert html_response(conn, 200) =~ "Edit gfp application"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gfp_application = Repo.insert! %GfpApplication{}
    conn = put conn, gfp_application_path(conn, :update, gfp_application), gfp_application: @valid_attrs
    assert redirected_to(conn) == gfp_application_path(conn, :show, gfp_application)
    assert Repo.get_by(GfpApplication, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gfp_application = Repo.insert! %GfpApplication{}
    conn = put conn, gfp_application_path(conn, :update, gfp_application), gfp_application: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gfp application"
  end

  test "deletes chosen resource", %{conn: conn} do
    gfp_application = Repo.insert! %GfpApplication{}
    conn = delete conn, gfp_application_path(conn, :delete, gfp_application)
    assert redirected_to(conn) == gfp_application_path(conn, :index)
    refute Repo.get(GfpApplication, gfp_application.id)
  end
end
