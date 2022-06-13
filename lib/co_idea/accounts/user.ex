defmodule CoIdea.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :fname, :string
    field :national_code, :string
    field :student_code, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:national_code, :student_code, :name, :fname])
    |> validate_required([:national_code, :student_code, :name, :fname])
  end
end
