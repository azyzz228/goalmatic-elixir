defmodule GoalmaticExAs1036.Achievement.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :amount, :integer
    field :note, :string
    field :challenge_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:note, :amount])
    |> validate_required([:note, :amount])
  end
end
