defmodule GfpActivity.Notification do
  use Ecto.Schema
  import Ecto.Changeset
  alias GfpActivity.Notification


  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  
  schema "notifications" do
    field :activity_id, :binary_id
    field :user_id, :integer
    field :account_id, :integer
    timestamps()
  end

  @doc false
  def changeset(%Notification{} = notification, attrs) do
    notification
    |> cast(attrs, [:activity_id, :user_id, :account_id])
    |> validate_required([:activity_id, :user_id, :account_id])
  end
end
