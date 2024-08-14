defmodule BankElixirPhoenixWeb.UsersControllerTest do
  alias BankElixirPhoenix.Users
  use BankElixirPhoenixWeb.ConnCase

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        name: "João",
        cep: "12345678",
        email: "joao@gmail.com",
        password: "123456"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
        "data" => %{
          "cep" => "12345678",
          "email" => "joao@gmail.com",
          "id" => _id,
          "name" => "João"},
          "message" => "User criado com sucesso!"
        } = response
    end

    test "fail when creates an user", %{conn: conn} do
      params = %{
        name: "João",
        cep: "1",
        email: "joao@gmail.com",
        password: "1"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"cep" => ["should be 8 character(s)"],"password" => ["should be 6 character(s)"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn} do
      params = %{
        name: "João",
        cep: "12345678",
        email: "joao@gmail.com",
        password: "123456"
      }

      {:ok, user} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{user.id}")
        |> json_response(:ok)

      expected_response = %{"data" => %{"cep" => "12345678", "email" => "joao@gmail.com", "id" => user.id, "name" => "João"}}

      assert response == expected_response
    end
  end
end
