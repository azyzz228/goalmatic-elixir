defmodule GoalmaticExAs1036.Achievement.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "challenges" do
    field :description, :string
    field :ends_at, :utc_datetime
    field :goal, :integer
    field :name, :string
    field :units, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(challenge, attrs) do
    challenge
    |> cast(attrs, [:name, :description, :units, :goal, :ends_at])
    |> validate_required([:name, :description, :units, :goal, :ends_at])
  end
end
