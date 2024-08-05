defmodule BankElixirPhoenix.Users do
  alias BankElixirPhoenix.Users.Delete
  alias BankElixirPhoenix.Users.Update
  alias BankElixirPhoenix.Users.Get
  alias BankElixirPhoenix.Users.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
