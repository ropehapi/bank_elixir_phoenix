defmodule BankElixirPhoenixWeb.UsersController do
  alias BankElixirPhoenixWeb.FallbackController
  alias BankElixirPhoenix.Users.Create
  alias BankElixirPhoenix.Users.User

  use BankElixirPhoenixWeb, :controller

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
