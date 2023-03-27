defmodule GoalmaticExAs1036.Repo.Migrations.CreateChallenges do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :name, :string, null: false
      add :description, :string
      add :units, :string
      add :goal, :integer, default: 0
      add :ends_at, :utc_datetime
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:challenges, [:user_id])
  end
end
