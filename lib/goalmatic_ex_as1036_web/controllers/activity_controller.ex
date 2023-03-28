defmodule GoalmaticExAs1036Web.ActivityController do
  use GoalmaticExAs1036Web, :controller

  alias GoalmaticExAs1036.Achievement
  alias GoalmaticExAs1036.Achievement.Activity

  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, %{"challenge_id" => challenge_id}, _current_user) do
    challenge = Achievement.get_challenge!(challenge_id)
    activities = Achievement.list_challenge_activities(challenge)
    render(conn, :index, activities: activities, challenge: challenge)
  end

  def new(conn, %{"challenge_id" => challenge_id}, _current_user) do
    changeset = Achievement.change_activity(%Activity{})
    render(conn, :new, changeset: changeset, challenge: challenge_id)
  end

  def create(conn, %{"activity" => activity_params, "challenge_id" => challenge_id}, current_user) do
    challenge = Achievement.get_challenge!(challenge_id)
    case Achievement.create_activity(challenge, current_user, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: ~p"/challenges/#{challenge_id}/activities/#{activity}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id, "challenge_id" => challenge_id}, _current_user) do
    challenge = Achievement.get_challenge!(challenge_id)
    activity = Achievement.get_challenge_activity!(challenge, id)
    render(conn, :show, activity: activity, challenge: challenge_id)
  end

  def edit(conn, %{"id" => id, "challenge_id" => challenge_id}, _current_user) do
    challenge = Achievement.get_challenge!(challenge_id)
    activity = Achievement.get_challenge_activity!(challenge, id)
    changeset = Achievement.change_activity(activity)
    render(conn, :edit, activity: activity, changeset: changeset, challenge: challenge_id)
  end

  def update(conn, %{"id" => id, "activity" => activity_params, "challenge_id" => challenge_id}, _current_user) do
    challenge = Achievement.get_challenge!(challenge_id)
    activity = Achievement.get_challenge_activity!(challenge, id)

    case Achievement.update_activity(activity, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity updated successfully.")
        |> redirect(to: ~p"/challenges/#{challenge_id}/activities/#{activity}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, activity: activity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "challenge_id" => challenge_id}, _current_user) do
    activity = Achievement.get_activity!(id)
    {:ok, _activity} = Achievement.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: ~p"/challenges/#{challenge_id}")
  end
end
