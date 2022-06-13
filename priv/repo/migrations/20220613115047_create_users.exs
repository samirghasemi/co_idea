defmodule CoIdea.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :national_code, :string
      add :student_code, :string
      add :name, :string
      add :fname, :string

      timestamps()
    end
  end
end
