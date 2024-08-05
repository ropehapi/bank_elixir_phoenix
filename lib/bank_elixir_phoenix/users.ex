defmodule BankElixirPhoenix.Users do
  alias BankElixirPhoenix.Users.Get
  alias BankElixirPhoenix.Users.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(params), to: Get, as: :call
end
