defmodule BankElixirPhoenix.Users.Create do
  alias BankElixirPhoenix.Users.User
  alias BankElixirPhoenix.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
