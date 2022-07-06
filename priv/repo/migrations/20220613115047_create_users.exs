defmodule CoIdea.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :national_code, :string
      add :student_code, :string
      add :name, :string
      add :fname, :string
      add :password, :string
      add :avatar, :string

      timestamps()
    end

    create unique_index(:users, [:national_code , :student_code])

  end
end
