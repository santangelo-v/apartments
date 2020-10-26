# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apartments,
  ecto_repos: [Apartments.Repo]

# Configures the endpoint
config :apartments, ApartmentsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Pnlr4UCguXg9/EvxLPYGm3MCdGz6ht7vXNr6QJhppt5lC4pl+V8hfXxmnJZhQPuG",
  render_errors: [view: ApartmentsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Apartments.PubSub,
  live_view: [signing_salt: "w3uIX9aB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
