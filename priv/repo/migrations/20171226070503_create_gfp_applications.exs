defmodule GfpActivity.Repo.Migrations.CreateGfpApplications do
  use Ecto.Migration

  def change do
    create table(:gfp_applications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :webhook_url, :string

      timestamps()
    end

  end
end
