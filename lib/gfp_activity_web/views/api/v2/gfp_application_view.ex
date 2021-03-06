defmodule GfpActivityWeb.Api.V2.GfpApplicationView do
  use GfpActivityWeb, :view

  def render("index.json", %{gfp_applications: gfp_applications}) do
    %{data: render_many(gfp_applications, GfpActivityWeb.Api.V2.GfpApplicationView, "gfp_application.json")}
  end

  def render("show.json", %{gfp_application: gfp_application}) do
    %{data: render_one(gfp_application, GfpActivityWeb.Api.V2.GfpApplicationView, "gfp_application.json")}
  end

  def render("gfp_application.json", %{gfp_application: gfp_application}) do
    %{webhook_url: gfp_application.webhook_url}
  end
end
