defmodule FirstApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
     {
      Plug.Cowboy, scheme: :http, plug: FirstApi.Router, options: [port: 8000]
     }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirstApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
