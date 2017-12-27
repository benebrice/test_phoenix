defmodule GfpActivity.Repo.Migrations.CreateActivityKeys do
  use Ecto.Migration

  def change do
    create table(:activity_keys) do
      add :activity_key, :string, primary_key: true
      add :activity_page, :boolean
      add :in_app, :boolean
      add :sms, :boolean
      add :email, :boolean
      
      timestamps()
    end

  end
end
