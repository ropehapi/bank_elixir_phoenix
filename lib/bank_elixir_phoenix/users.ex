defmodule BankElixirPhoenix.Users do
  alias BankElixirPhoenix.Users.Create

  defdelegate create(params), to: Create, as: :call
end
