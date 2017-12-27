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

  scope "/api", GfpActivity do
    pipe_through :api
    scope "/v1", V1, as: :v1 do
      resources "/categories", CategoryController
      resources "/activities", ActivityController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GfpActivityWeb do
  #   pipe_through :api
  # end
end
