defmodule MyPlug do
  use Plug.Router
  import Plug.Conn

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, "public/index.html")
  end

  get "favicon.ico" do
    send_resp(conn, 404, "not found")
  end

  get "/:file" do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, "public/#{file}")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
