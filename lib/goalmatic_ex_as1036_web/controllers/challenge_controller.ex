defmodule GoalmaticExAs1036Web.ChallengeController do
  use GoalmaticExAs1036Web, :controller

  alias GoalmaticExAs1036.Achievement
  alias GoalmaticExAs1036.Achievement.Challenge

  def index(conn, _params) do
    challenges = Achievement.list_challenges()
    render(conn, :index, challenges: challenges)
  end

  def new(conn, _params) do
    changeset = Achievement.change_challenge(%Challenge{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"challenge" => challenge_params}) do
    case Achievement.create_challenge(challenge_params) do
      {:ok, challenge} ->
        conn
        |> put_flash(:info, "Challenge created successfully.")
        |> redirect(to: ~p"/challenges/#{challenge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    challenge = Achievement.get_challenge!(id)
    render(conn, :show, challenge: challenge)
  end

  def edit(conn, %{"id" => id}) do
    challenge = Achievement.get_challenge!(id)
    changeset = Achievement.change_challenge(challenge)
    render(conn, :edit, challenge: challenge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "challenge" => challenge_params}) do
    challenge = Achievement.get_challenge!(id)

    case Achievement.update_challenge(challenge, challenge_params) do
      {:ok, challenge} ->
        conn
        |> put_flash(:info, "Challenge updated successfully.")
        |> redirect(to: ~p"/challenges/#{challenge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, challenge: challenge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    challenge = Achievement.get_challenge!(id)
    {:ok, _challenge} = Achievement.delete_challenge(challenge)

    conn
    |> put_flash(:info, "Challenge deleted successfully.")
    |> redirect(to: ~p"/challenges")
  end
end
