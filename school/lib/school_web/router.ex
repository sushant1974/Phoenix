defmodule SchoolWeb.Router do
  use SchoolWeb, :router

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

  scope "/", SchoolWeb do
    pipe_through :browser

    get "/", PageController, :index
	 resources "/students", StudentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchoolWeb do
  #   pipe_through :api
  # end
end
