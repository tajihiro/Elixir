defmodule PhoenixSample.Member do
  use PhoenixSample.Web, :model

  schema "members" do
    field :last_name, :string
    field :first_name, :string
    field :email, :string
    field :passwd, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:last_name, :first_name, :email, :passwd])
    |> validate_required([:last_name, :first_name, :email, :passwd])
  end
end
