defmodule GoalmaticExAs1036.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GoalmaticExAs1036Web.Telemetry,
      # Start the Ecto repository
      GoalmaticExAs1036.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GoalmaticExAs1036.PubSub},
      # Start Finch
      {Finch, name: GoalmaticExAs1036.Finch},
      # Start the Endpoint (http/https)
      GoalmaticExAs1036Web.Endpoint
      # Start a worker by calling: GoalmaticExAs1036.Worker.start_link(arg)
      # {GoalmaticExAs1036.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoalmaticExAs1036.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GoalmaticExAs1036Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
