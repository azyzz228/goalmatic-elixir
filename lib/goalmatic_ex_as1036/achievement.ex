defmodule GoalmaticExAs1036.Achievement do
  @moduledoc """
  The Achievement context.
  """

  import Ecto.Query, warn: false

  alias GoalmaticExAs1036.Repo
  alias GoalmaticExAs1036.Achievement.Challenge
  alias GoalmaticExAs1036.Accounts.User
  @doc """
  Returns the list of challenges.

  ## Examples

      iex> list_challenges()
      [%Challenge{}, ...]

  """
  def list_challenges do
    Repo.all(Challenge)
  end

  def list_user_challenges(%User{} = user) do
    Challenge
    |> user_challenges_query(user)
    |> Repo.all()
  end

  def list_user_challenges(%User{} = user, params) do
    search_term = get_in(params, ["search_term"])
    Challenge
    |> user_challenges_query(user)
    |> challenge_search(search_term)
    |> Repo.all()
  end

  def challenge_search(query, search_term) do
    search = "%#{search_term}"
    from challenge in query, where: like(challenge.name, ^search)
  end

  def get_user_challenge!(%User{} = user, id) do
    Challenge
    |> user_challenges_query(user)
    |> Repo.get!(id)
  end

  defp user_challenges_query(query, %User{id: user_id}) do
    from(challenge in query, where: challenge.user_id == ^user_id)
  end

  @doc """
  Gets a single challenge.

  Raises `Ecto.NoResultsError` if the Challenge does not exist.

  ## Examples

      iex> get_challenge!(123)
      %Challenge{}

      iex> get_challenge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_challenge!(id), do: Repo.get!(Challenge, id)

  @doc """
  Creates a challenge.

  ## Examples

      iex> create_challenge(%{field: value})
      {:ok, %Challenge{}}

      iex> create_challenge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_challenge(%User{} = user, attrs \\ %{}) do
    %Challenge{}
    |> Challenge.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a challenge.

  ## Examples

      iex> update_challenge(challenge, %{field: new_value})
      {:ok, %Challenge{}}

      iex> update_challenge(challenge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_challenge(%Challenge{} = challenge, attrs) do
    challenge
    |> Challenge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a challenge.

  ## Examples

      iex> delete_challenge(challenge)
      {:ok, %Challenge{}}

      iex> delete_challenge(challenge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_challenge(%Challenge{} = challenge) do
    Repo.delete(challenge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking challenge changes.

  ## Examples

      iex> change_challenge(challenge)
      %Ecto.Changeset{data: %Challenge{}}

  """
  def change_challenge(%Challenge{} = challenge, attrs \\ %{}) do
    Challenge.changeset(challenge, attrs)
  end

  alias GoalmaticExAs1036.Achievement.Activity

  @doc """
  Returns the list of activities.

  ## Examples

      iex> list_activities()
      [%Activity{}, ...]

  """
  def list_activities do
    Repo.all(Activity)
  end

  def list_challenge_activities(%Challenge{} = challenge) do
    Activity
    |> challenge_activities_query(challenge)
    |> Repo.all()
  end

  def get_challenge_activity!(%Challenge{} = challenge, id) do
    Activity
    |> challenge_activities_query(challenge)
    |> Repo.get!(id)
  end

  defp challenge_activities_query(query, %Challenge{id: id}) do
    from(activity in query, where: activity.challenge_id == ^id)
  end
  @doc """
  Gets a single activity.

  Raises `Ecto.NoResultsError` if the Activity does not exist.

  ## Examples

      iex> get_activity!(123)
      %Activity{}

      iex> get_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activity!(id), do: Repo.get!(Activity, id)

  @doc """
  Creates a activity.

  ## Examples

      iex> create_activity(%{field: value})
      {:ok, %Activity{}}

      iex> create_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activity( %Challenge{} = challenge, %User{} = user, attrs \\ %{}) do
    %Activity{}
    |> Activity.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:challenge, challenge)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a activity.

  ## Examples

      iex> update_activity(activity, %{field: new_value})
      {:ok, %Activity{}}

      iex> update_activity(activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activity(%Activity{} = activity, attrs) do
    activity
    |> Activity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a activity.

  ## Examples

      iex> delete_activity(activity)
      {:ok, %Activity{}}

      iex> delete_activity(activity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activity(%Activity{} = activity) do
    Repo.delete(activity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activity changes.

  ## Examples

      iex> change_activity(activity)
      %Ecto.Changeset{data: %Activity{}}

  """
  def change_activity(%Activity{} = activity, attrs \\ %{}) do
    Activity.changeset(activity, attrs)
  end
end
