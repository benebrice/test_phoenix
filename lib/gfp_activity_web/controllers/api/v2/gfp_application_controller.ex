defmodule GfpActivityWeb.Api.V2.GfpApplicationController do
  use GfpActivityWeb, :controller
  alias GfpActivity.Repo
  alias GfpActivity.GfpApplication
  
  def index(conn, _params) do
    gfp_applications = Repo.all(GfpApplication)
    render(conn, "index.json", gfp_applications: gfp_applications)
  end

  def show(conn, %{"id" => id}) do
    gfp_application = Repo.get!(GfpApplication, id)
    render(conn, "show.json", gfp_application: gfp_application)
  end

end
