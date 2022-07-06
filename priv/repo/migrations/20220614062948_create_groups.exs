defmodule CoIdea.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :title, :string
      add :description, :string
      add :avatar, :string

      timestamps()
    end
  end
end
