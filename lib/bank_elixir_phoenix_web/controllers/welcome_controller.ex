defmodule BankElixirPhoenixWeb.WelcomeController do
  use BankElixirPhoenixWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{message: "Bem vindo ao banking api", status: :ok})
  end

end
