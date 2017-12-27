defmodule GfpActivityWeb.GfpApplicationController do
  use GfpActivityWeb, :controller
  alias GfpActivity.Repo
  alias GfpActivity.GfpApplication

  def index(conn, _params) do
    gfp_applications = Repo.all(GfpApplication)
    render(conn, "index.html", gfp_applications: gfp_applications)
  end

  def new(conn, _params) do
    changeset = GfpApplication.changeset(%GfpApplication{}, %{webhook_url: 'Set the webhook url...'})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gfp_application" => gfp_application_params}) do
    changeset = GfpApplication.changeset(%GfpApplication{}, gfp_application_params)

    case Repo.insert(changeset) do
      {:ok, gfp_application} ->
        conn
        |> put_flash(:info, "Gfp application created successfully.")
        |> redirect(to: gfp_application_path(conn, :show, gfp_application))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gfp_application = Repo.get!(GfpApplication, id)
    render(conn, "show.html", gfp_application: gfp_application)
  end

  def edit(conn, %{"id" => id}) do
    gfp_application = Repo.get!(GfpApplication, id)
    changeset = GfpApplication.changeset(gfp_application)
    render(conn, "edit.html", gfp_application: gfp_application, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gfp_application" => gfp_application_params}) do
    gfp_application = Repo.get!(GfpApplication, id)
    changeset = GfpApplication.changeset(gfp_application, gfp_application_params)

    case Repo.update(changeset) do
      {:ok, gfp_application} ->
        conn
        |> put_flash(:info, "Gfp application updated successfully.")
        |> redirect(to: gfp_application_path(conn, :show, gfp_application))
      {:error, changeset} ->
        render(conn, "edit.html", gfp_application: gfp_application, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gfp_application = Repo.get!(GfpApplication, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gfp_application)

    conn
    |> put_flash(:info, "Gfp application deleted successfully.")
    |> redirect(to: gfp_application_path(conn, :index))
  end
end
