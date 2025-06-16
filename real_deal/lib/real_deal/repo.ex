defmodule RealDeal.Repo do
  use Ecto.Repo,
    otp_app: :real_deal,
    adapter: Ecto.Adapters.Postgres
end
