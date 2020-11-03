defmodule Debug.Repo do
  use Ecto.Repo,
    otp_app: :debug,
    adapter: Ecto.Adapters.Postgres
end
