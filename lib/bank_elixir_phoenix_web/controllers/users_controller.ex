defmodule BankElixirPhoenixWeb.UsersController do
  alias BankElixirPhoenix.Users.Create
  use BankElixirPhoenixWeb, :controller

  def create(conn, params) do
    params
    |> Create.call()
    |> log_response()
    |> handle_response(conn)
  end

  defp log_response(response) do
    IO.inspect(response, label: "Create.call/1 response")
    response
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end

  defp handle_response({:error, changeset}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BankElixirPhoenixWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
