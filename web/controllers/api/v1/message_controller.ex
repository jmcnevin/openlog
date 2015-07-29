defmodule Openlog.API.V1.MessageController do
  use Openlog.Web, :controller

  alias Openlog.Log
  alias Openlog.Message

  plug :scrub_params, "message"

  def create(conn, %{"log_id" => log_id, "message" => message_params}) do
    log = Repo.get!(Log, log_id)

    changeset = Message.changeset(build(log, :messages), message_params)

    if changeset.valid? do
      message = Repo.insert!(changeset)

      Openlog.Endpoint.broadcast! "logs:#{log.id}", "new_msg", %{body: message.body, occurred_at: message.occurred_at}

      conn
      |> render(Openlog.MessageView, "show.json", message: message)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Openlog.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
