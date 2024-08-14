defmodule BankElixirPhoenixWeb.WelcomeController do
  use BankElixirPhoenixWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem vindo ao banking api"})
  end
end
