defmodule GoalmaticExAs1036.Achievement.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "challenges" do
    field :description, :string
    field :ends_at, :utc_datetime
    field :goal, :integer
    field :name, :string
    field :progress, :integer
    field :units, :string
    belongs_to :user, GoalmaticExAs1036.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(challenge, attrs) do
    challenge
    |> cast(attrs, [:name, :description, :units, :goal, :ends_at, :progress])
    |> validate_required([:name, :goal, :ends_at])
  end

  def total_progress(activities) do
    activities
    |> Enum.reduce(0, fn activity, acc -> acc + activity.amount end)
  end
end
