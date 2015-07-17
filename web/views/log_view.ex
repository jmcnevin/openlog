defmodule Openlog.LogView do
  use Openlog.Web, :view

  def render("show.json", %{log: log}) do
    %{data: render_one(log, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id}
  end
end
