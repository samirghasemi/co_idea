defmodule CoIdea.Uploads.GroupProfile do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition
  def __storage, do: Arc.Storage.Local

  @versions [:original]

  # To add a thumbnail version:
  # @versions [:original, :thumb]

  # Override the bucket on a per definition basis:
  # def bucket do
  #   :custom_bucket_name
  # end

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  # def transform(:thumb, _) do
  #   {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  # end

  # Override the persisted filenames:


  # Override the storage directory:
  def storage_dir(_version, {_file, scope}) do
    "uploads/groups/avatars/#{scope.id}"
  end

  def filename(version, {file, scope}) do
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))
    "#{scope.id}_#{version}_#{file_name}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  def default_url(_version) do
    CoIdeaWeb.Endpoint.url <> "/uploads/groups/default.png"
  end
end
