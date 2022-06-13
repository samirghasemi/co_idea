defmodule CoIdea.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoIdea.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        fname: "some fname",
        name: "some name",
        national_code: "some national_code",
        student_code: "some student_code"
      })
      |> CoIdea.Accounts.create_user()

    user
  end
end
