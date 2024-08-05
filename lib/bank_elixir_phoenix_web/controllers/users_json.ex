defmodule BankElixirPhoenixWeb.UsersJSON do
  alias BankElixirPhoenix.Users.User
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}

  def update(%{user: user}) do
    %{
      message: "User atualizado com sucesso!",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
