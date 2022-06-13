defmodule CoIdea.Repo do
  use Ecto.Repo,
    otp_app: :co_idea,
    adapter: Ecto.Adapters.Postgres
end
