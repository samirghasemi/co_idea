defmodule CoIdeaWeb.RoleView do
  use CoIdeaWeb, :view
  alias CoIdeaWeb.RoleView

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{
      id: role.id,
      title: role.title,
      description: role.description,
      role_number: role.role_number
    }
  end
end
