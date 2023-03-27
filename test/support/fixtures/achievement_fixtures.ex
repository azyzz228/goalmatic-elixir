defmodule GoalmaticExAs1036.AchievementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GoalmaticExAs1036.Achievement` context.
  """

  @doc """
  Generate a challenge.
  """
  def challenge_fixture(attrs \\ %{}) do
    {:ok, challenge} =
      attrs
      |> Enum.into(%{
        description: "some description",
        ends_at: ~U[2023-03-26 21:37:00Z],
        goal: 42,
        name: "some name",
        units: "some units"
      })
      |> GoalmaticExAs1036.Achievement.create_challenge()

    challenge
  end

  @doc """
  Generate a activity.
  """
  def activity_fixture(attrs \\ %{}) do
    {:ok, activity} =
      attrs
      |> Enum.into(%{
        amount: 42,
        note: "some note"
      })
      |> GoalmaticExAs1036.Achievement.create_activity()

    activity
  end
end
