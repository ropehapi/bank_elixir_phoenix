defmodule BankElixirPhoenix.Users.Get do
  alias BankElixirPhoenix.Users.User
  alias BankElixirPhoenix.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
