# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :elixir_docker, ElixirDockerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q0/XP00nMED3l4PbK5I3ddhqLi6LEdqaecfc7NWLRqTW4HBhdGFztq0kzhHpN3mj",
  render_errors: [view: ElixirDockerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirDocker.PubSub,
  live_view: [signing_salt: "bMHLXjWi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
