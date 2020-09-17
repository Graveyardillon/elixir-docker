defmodule ElixirDockerWithEcto.Repo do
  use Ecto.Repo,
    otp_app: :elixir_docker_with_ecto,
    adapter: Ecto.Adapters.Postgres
end
