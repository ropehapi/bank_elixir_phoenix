defmodule BankElixirPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :bank_elixir_phoenix,
    adapter: Ecto.Adapters.Postgres
end
