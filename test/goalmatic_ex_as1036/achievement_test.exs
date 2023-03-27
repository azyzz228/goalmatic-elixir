defmodule GoalmaticExAs1036.AchievementTest do
  use GoalmaticExAs1036.DataCase

  alias GoalmaticExAs1036.Achievement

  describe "challenges" do
    alias GoalmaticExAs1036.Achievement.Challenge

    import GoalmaticExAs1036.AchievementFixtures

    @invalid_attrs %{description: nil, ends_at: nil, goal: nil, name: nil, units: nil}

    test "list_challenges/0 returns all challenges" do
      challenge = challenge_fixture()
      assert Achievement.list_challenges() == [challenge]
    end

    test "get_challenge!/1 returns the challenge with given id" do
      challenge = challenge_fixture()
      assert Achievement.get_challenge!(challenge.id) == challenge
    end

    test "create_challenge/1 with valid data creates a challenge" do
      valid_attrs = %{description: "some description", ends_at: ~U[2023-03-26 21:37:00Z], goal: 42, name: "some name", units: "some units"}

      assert {:ok, %Challenge{} = challenge} = Achievement.create_challenge(valid_attrs)
      assert challenge.description == "some description"
      assert challenge.ends_at == ~U[2023-03-26 21:37:00Z]
      assert challenge.goal == 42
      assert challenge.name == "some name"
      assert challenge.units == "some units"
    end

    test "create_challenge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievement.create_challenge(@invalid_attrs)
    end

    test "update_challenge/2 with valid data updates the challenge" do
      challenge = challenge_fixture()
      update_attrs = %{description: "some updated description", ends_at: ~U[2023-03-27 21:37:00Z], goal: 43, name: "some updated name", units: "some updated units"}

      assert {:ok, %Challenge{} = challenge} = Achievement.update_challenge(challenge, update_attrs)
      assert challenge.description == "some updated description"
      assert challenge.ends_at == ~U[2023-03-27 21:37:00Z]
      assert challenge.goal == 43
      assert challenge.name == "some updated name"
      assert challenge.units == "some updated units"
    end

    test "update_challenge/2 with invalid data returns error changeset" do
      challenge = challenge_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievement.update_challenge(challenge, @invalid_attrs)
      assert challenge == Achievement.get_challenge!(challenge.id)
    end

    test "delete_challenge/1 deletes the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{}} = Achievement.delete_challenge(challenge)
      assert_raise Ecto.NoResultsError, fn -> Achievement.get_challenge!(challenge.id) end
    end

    test "change_challenge/1 returns a challenge changeset" do
      challenge = challenge_fixture()
      assert %Ecto.Changeset{} = Achievement.change_challenge(challenge)
    end
  end

  describe "activities" do
    alias GoalmaticExAs1036.Achievement.Activity

    import GoalmaticExAs1036.AchievementFixtures

    @invalid_attrs %{amount: nil, note: nil}

    test "list_activities/0 returns all activities" do
      activity = activity_fixture()
      assert Achievement.list_activities() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Achievement.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      valid_attrs = %{amount: 42, note: "some note"}

      assert {:ok, %Activity{} = activity} = Achievement.create_activity(valid_attrs)
      assert activity.amount == 42
      assert activity.note == "some note"
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievement.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      update_attrs = %{amount: 43, note: "some updated note"}

      assert {:ok, %Activity{} = activity} = Achievement.update_activity(activity, update_attrs)
      assert activity.amount == 43
      assert activity.note == "some updated note"
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievement.update_activity(activity, @invalid_attrs)
      assert activity == Achievement.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Achievement.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Achievement.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Achievement.change_activity(activity)
    end
  end
end
