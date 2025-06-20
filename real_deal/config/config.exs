# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :real_deal,
  ecto_repos: [RealDeal.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :real_deal, RealDealWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: RealDealWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: RealDeal.PubSub,
  live_view: [signing_salt: "pognfLdu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#configures Guardian
config :real_deal, RealDealWeb.Auth.Guardian,
  issuer: "real_deal",
  secret_key: "lNc0lcgsFIujD3DJOuyaZGgFtyXCRuMq8mG+DWK9DzjUDMvtLug3EvTZU4EQjTNc"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
