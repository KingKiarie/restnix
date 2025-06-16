defmodule RealDealWeb.DefaultController do
  use RealDealWeb, :controller

  def index(conn, _params) do

    text conn, "The Real Deal API id Live -#{Mix.env()}"

  end

end
