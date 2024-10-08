defmodule BankElixirPhoenix.Users.Create do
  alias BankElixirPhoenix.ViaCep.Client, as: ViaCepClient
  alias BankElixirPhoenix.Users.User
  alias BankElixirPhoenix.Repo

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
