defmodule School.RRBPTest do
  use School.DataCase

  alias School.RRBP

  describe "students" do
    alias School.RRBP.Student

    @valid_attrs %{address: "some address", class: 42, name: "some name", roll_number: 42}
    @update_attrs %{address: "some updated address", class: 43, name: "some updated name", roll_number: 43}
    @invalid_attrs %{address: nil, class: nil, name: nil, roll_number: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RRBP.create_student()

      student
    end

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert RRBP.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert RRBP.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = RRBP.create_student(@valid_attrs)
      assert student.address == "some address"
      assert student.class == 42
      assert student.name == "some name"
      assert student.roll_number == 42
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RRBP.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, %Student{} = student} = RRBP.update_student(student, @update_attrs)
      assert student.address == "some updated address"
      assert student.class == 43
      assert student.name == "some updated name"
      assert student.roll_number == 43
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = RRBP.update_student(student, @invalid_attrs)
      assert student == RRBP.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = RRBP.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> RRBP.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = RRBP.change_student(student)
    end
  end
end
