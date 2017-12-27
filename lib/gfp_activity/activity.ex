defmodule GfpActivity.Activity do
  use Ecto.Schema
  import Ecto.Changeset
  alias GfpActivity.Activity


  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "activities" do
    field :activity_from_id, :binary_id
    field :activity_from_type, :string
    field :activity_to_id, :binary_id
    field :activity_to_type, :string
    field :activity_type_key, :string
    field :parameters, :map
    field :account_id, :binary_id
    field :gfp_application_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Activity{} = activity, attrs) do
    activity
    |> cast(attrs, [:activity_from_id, :activity_from_type, :activity_to_id, :activity_to_type, :activity_type_key, :parameters, :account_id, :gfp_application_id])
    |> validate_required([:activity_from_id, :activity_from_type, :activity_to_id, :activity_to_type, :activity_type_key, :parameters, :account_id, :gfp_application_id])
  end
end
