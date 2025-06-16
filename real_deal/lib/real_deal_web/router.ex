defmodule RealDealWeb.Router do
  use RealDealWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RealDealWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
