defmodule Openlog.Router do
  use Openlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Openlog do
    pipe_through :browser
    get "/", PageController, :index
    resources "logs", LogController
  end

  scope "/api", Openlog.API, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "logs", LogController, except: [:index, :new, :edit] do
        resources "messages", MessageController, only: [:create]
      end
    end
  end

  socket "/ws", Openlog do
    channel "logs:*", LogChannel
  end
end
