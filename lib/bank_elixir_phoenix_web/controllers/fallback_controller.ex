defmodule BankElixirPhoenixWeb.FallbackController do
  use BankElixirPhoenixWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BankElixirPhoenixWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end

end
