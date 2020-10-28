defmodule ApartmentsWeb.Router do
  use ApartmentsWeb, :router

  resources "/apartments", ApartmentsWeb.ApartmentsController
  resources "/reservations", ApartmentsWeb.ReservationsController
  resources "/weathers", ApartmentsWeb.WeathersController

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

  scope "/", ApartmentsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/apartment", PageController, :apartment
  end

  # scope "/apartments", ApartmentsWeb do
  #  pipe_through :api

  #  get "/", ApartmentsController, :show
  #  get "/:id", ApartmentsController, :show
  # end

  # scope "/calendars", ApartmentsWeb do
  #  pipe_through :api

  #  get "/", CalendarsController, :show
  #  get "/:id", CalendarsController, :show
  # end

  # Other scopes may use custom stacks.
  # scope "/api", ApartmentsWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ApartmentsWeb.Telemetry
    end
  end
end
