defmodule GfpActivity.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :activity_from_id, :uuid
      add :activity_from_type, :string
      add :activity_to_id, :uuid
      add :activity_to_type, :string
      add :activity_type_key, :string
      add :parameters, :map
      add :account_id, :uuid
      add :gfp_application_id, references(:gfp_applications, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end
  end
end