defmodule Openlog.LogChannel do
  use Phoenix.Channel

  def join("logs:" <> _log_id, _auth_msg, socket) do
    {:ok, socket}
  end

  # def handle_in("new_msg", %{"body" => body}, socket) do
  #   broadcast! socket, "new_msg", %{body: body}
  #   {:noreply, socket}
  # end

  intercept ["new_msg"]

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
