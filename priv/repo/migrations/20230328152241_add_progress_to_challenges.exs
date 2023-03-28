defmodule GoalmaticExAs1036.Repo.Migrations.AddProgressToChallenges do
  use Ecto.Migration

  def change do
    alter table("challenges") do
      add :progress, :integer, default: 0
    end
  end
end
