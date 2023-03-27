defmodule GoalmaticExAs1036.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :note, :string
      add :amount, :integer, default: 0
      add :challenge_id, references(:challenges, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:activities, [:challenge_id])
    create index(:activities, [:user_id])
  end
end
