defmodule RealDeal.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :full_name, :string
    field :gender, :string
    field :bio, :string
    belongs_to :account , RealDeal.Accounts.Account
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:full_name, :gender, :bio, :account_id])
    |> validate_required([:account_id])
  end
end
