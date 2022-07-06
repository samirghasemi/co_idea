defmodule CoIdea.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :title, :string
      add :description, :string
      add :role_number, :integer

      timestamps()
    end
  end
end
