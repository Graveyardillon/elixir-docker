# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_docker_with_ecto,
  ecto_repos: [ElixirDockerWithEcto.Repo]

# Configures the endpoint
config :elixir_docker_with_ecto, ElixirDockerWithEctoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dfULJrqcROhbeYqRzgk0f1MHY6PPJJ6AUkhRIGKaojW7efVSpZxnG0Hhhm7Nvr9y",
  render_errors: [view: ElixirDockerWithEctoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirDockerWithEcto.PubSub,
  live_view: [signing_salt: "8/jxRQ16"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
