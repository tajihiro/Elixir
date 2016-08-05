defmodule PhoenixSample.HelloController do
  use PhoenixSample.Web, :controller

  def index(conn, _params) do
#    members = Repo.all(PhoenixSample.User)
#    render conn, "index.html", members: members
    render conn, "index.html"

  end
end