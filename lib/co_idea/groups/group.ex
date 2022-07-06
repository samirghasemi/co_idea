defmodule CoIdea.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "groups" do
    field :avatar, :string
    field :description, :string
    field :title, CoIdea.Uploads.GroupProfile.Type

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:title, :description])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
