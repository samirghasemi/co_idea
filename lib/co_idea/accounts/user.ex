defmodule CoIdea.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema
  alias Pbkdf2

  schema "users" do
    field :national_code, :string
    field :student_code, :string
    field :name, :string
    field :fname, :string
    field :password, :string
    field :avatar, CoIdea.Uploads.UserProfile.Type
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:national_code, :student_code, :name, :fname,:password])
    |> cast_attachments(attrs,[:avatar])
    |> validate_required([:national_code, :student_code, :name, :fname,:password])
    |> unique_constraint(:national_code , :student_code)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Pbkdf2.hash_pwd_salt(password))
  end

end
