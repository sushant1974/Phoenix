defmodule School.RRBP.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :address, :string
    field :class, :integer
    field :name, :string
    field :roll_number, :integer

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:roll_number, :class, :name, :address])
    |> validate_required([:roll_number, :class, :name, :address])
  end
end
