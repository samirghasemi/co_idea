defmodule CoIdea.GroupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoIdea.Groups` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        description: "some description",
        title: "some title"
      })
      |> CoIdea.Groups.create_group()

    group
  end
end
