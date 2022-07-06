defmodule CoIdea.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :description, :string
    field :role_number, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:title, :description, :role_number])
    |> validate_required([:title, :description, :role_number])
  end
end
