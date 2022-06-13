defmodule CoIdeaWeb.UserView do
  use CoIdeaWeb, :view
  alias CoIdeaWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      national_code: user.national_code,
      student_code: user.student_code,
      name: user.name,
      fname: user.fname
    }
  end
end
