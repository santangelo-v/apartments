defmodule Apartments.Repo do
  use Ecto.Repo,
    otp_app: :apartments,
    adapter: Ecto.Adapters.Postgres
end
