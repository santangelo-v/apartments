defmodule Apartments.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Apartments.Repo,
      # Start the Telemetry supervisor
      ApartmentsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Apartments.PubSub},
      # Start the Endpoint (http/https)
      ApartmentsWeb.Endpoint,
      # Start Rabbit connection
      Apartments.Rabbit.Connection

      # Start a worker by calling: Apartments.Worker.start_link(arg)
      # {Apartments.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Apartments.Supervisor]
    Supervisor.start_link(children, opts)
    Apartments.Rabbit.Consumer.start_link(connection: Apartments.Rabbit.Connection, queue: "reservations_queue", prefetch_count: 20)
    Apartments.Rabbit.Producer.start_link(connection: Apartments.Rabbit.Connection, publish_opts: [content_type: "application/json"])
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ApartmentsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
