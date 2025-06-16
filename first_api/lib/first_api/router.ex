defmodule FirstApi.Router do
  use Plug.Router
  # step 1
  plug(Plug.Logger)
  # step:2
  plug(:match)
  # step 3
  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/", do: send_resp(conn, 200, "OK")

  get "/aliens", do: send_resp(conn, 200, "Bozark")


  match _, do: send_resp(conn, 404, "Not found")


end
