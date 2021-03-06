defmodule Memesmail do
  @moduledoc """
  Documentation for Memesmail.
  """

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    PgStore.Super.start_link

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(PhoenixTry2.Endpoint, []),
      # Start your own worker by calling: PhoenixTry2.Worker.start_link(arg1, arg2, arg3)
      # worker(PhoenixTry2.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixTry2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixTry2.Endpoint.config_change(changed, removed)
    :ok
  end


#  use Application
#
#  def start(_type, _args) do
#  end

end


