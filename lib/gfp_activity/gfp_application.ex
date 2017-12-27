defmodule GfpActivity.GfpApplication do
  use Ecto.Schema
  import Ecto.Changeset
  alias GfpActivity.GfpApplication

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "gfp_applications" do
    field :webhook_url, :string
    timestamps()
  end

  @doc false
  def changeset(%GfpApplication{} = gfp_application, attrs) do
    gfp_application
    |> cast(attrs, [:webhook_url])
    |> validate_required([:webhook_url])
  end
end
