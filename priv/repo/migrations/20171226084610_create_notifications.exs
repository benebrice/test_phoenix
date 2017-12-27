defmodule GfpActivity.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :activity_id, references(:activities, on_delete: :nothing, type: :binary_id)
      add :user_id, :integer
      add :account_id, :integer

      timestamps()
    end
  end
end
