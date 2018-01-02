defmodule GfpActivityWeb.Router do
  use GfpActivityWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GfpActivityWeb do
    pipe_through :browser # Use the default browser stack
    get "/", GfpApplicationController, :index

    resources "/gfp_applications", GfpApplicationController
  end

  scope "/api", GfpActivityWeb, as: :api do
    pipe_through :api
    scope "/v1", Api.V1, as: :v1 do
      resources "/gfp_applications", GfpApplicationController, only: [:index, :show]
    end

    scope "/v2", Api.V2, as: :v2 do
      resources "/gfp_applications", GfpApplicationController, only: [:index, :show]
    end
  end

end
