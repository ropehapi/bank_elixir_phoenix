defmodule BankElixirPhoenix.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias BankElixirPhoenix.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfully returns cep info" do
      cep = "86601002"
      url_endpoint = endpoint_url(bypass.port)

      body = ~s{
        "bairro": "Manoel Müller",
        "cep": "86601-002",
        "complemento": "",
        "ddd": "43",
        "estado": "Paraná",
        "gia": "",
        "ibge": "4122404",
        "localidade": "Rolândia",
        "logradouro": "Rua Barão do Rio Branco",
        "regiao": "Sul",
        "siafi": "7825",
        "uf": "PR",
        "unidade": ""
      }

      expected_response = "aaa"

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      response = Client.call(url_endpoint, cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"
end
