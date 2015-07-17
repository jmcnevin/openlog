defmodule Openlog.API.V1.LogController do
  use Openlog.Web, :controller

  alias Openlog.Log

  plug :scrub_params, "log" when action in [:create, :update]

  def show(conn, %{"id" => id}) do
    log = Repo.get!(Log, id)
    render conn, "show.json", log: log
  end

  def create(conn, %{"log" => log_params}) do
    changeset = Log.changeset(%Log{}, log_params)

    if changeset.valid? do
      log = Repo.insert!(changeset)
      render(conn, "show.json", log: log)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Openlog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "log" => log_params}) do
    log = Repo.get!(Log, id)
    changeset = Log.changeset(log, log_params)

    if changeset.valid? do
      log = Repo.update!(changeset)
      render(conn, "show.json", log: log)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Openlog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    log = Repo.get!(Log, id)
    log = Repo.delete!(log)
    render(conn, "show.json", log: log)
  end
end
