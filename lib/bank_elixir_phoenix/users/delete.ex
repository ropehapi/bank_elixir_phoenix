defmodule BankElixirPhoenix.Users.Delete do
  alias BankElixirPhoenix.Users.User
  alias BankElixirPhoenix.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
