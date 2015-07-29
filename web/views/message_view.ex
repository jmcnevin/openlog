defmodule Openlog.MessageView do
  use Openlog.Web, :view

  def render("show.json", %{message: message}) do
    %{data: render_one(message, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id}
  end
end
