defmodule FirstApiTest.RouterTest do
  use ExUnit.Case, async: true

  import Plug.Test

  @opts FirstApi.Router.init([])

  test "Return ok" do
    build_conn = conn(:get, "/")
    conn = FirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end
end
