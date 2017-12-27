defmodule GfpActivity.ActivityKey do
  use Ecto.Schema
  import Ecto.Changeset
  alias GfpActivity.ActivityKey


  @primary_key {:activity_key, :string, []}
  @derive {Phoenix.Param, key: :activity_key}

  schema "activity_keys" do
    field :activity_page, :boolean
    field :in_app, :boolean
    field :sms, :boolean
    field :email, :boolean
    timestamps()
  end

  @doc false
  def changeset(%ActivityKey{} = activity_key, attrs) do
    activity_key
    |> cast(attrs, [])
    |> validate_required([])
  end
end
