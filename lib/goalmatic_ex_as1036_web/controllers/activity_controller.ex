defmodule GoalmaticExAs1036Web.ActivityController do
  use GoalmaticExAs1036Web, :controller

  alias GoalmaticExAs1036.Achievement
  alias GoalmaticExAs1036.Achievement.Activity

  def index(conn, _params) do
    activities = Achievement.list_activities()
    render(conn, :index, activities: activities)
  end

  def new(conn, _params) do
    changeset = Achievement.change_activity(%Activity{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"activity" => activity_params}) do
    case Achievement.create_activity(activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: ~p"/activities/#{activity}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activity = Achievement.get_activity!(id)
    render(conn, :show, activity: activity)
  end

  def edit(conn, %{"id" => id}) do
    activity = Achievement.get_activity!(id)
    changeset = Achievement.change_activity(activity)
    render(conn, :edit, activity: activity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Achievement.get_activity!(id)

    case Achievement.update_activity(activity, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity updated successfully.")
        |> redirect(to: ~p"/activities/#{activity}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, activity: activity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity = Achievement.get_activity!(id)
    {:ok, _activity} = Achievement.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: ~p"/activities")
  end
end
