defmodule School.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :roll_number, :integer
      add :class, :integer
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
