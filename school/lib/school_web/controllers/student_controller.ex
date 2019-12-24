defmodule SchoolWeb.StudentController do
  use SchoolWeb, :controller

  alias School.RRBP
  alias School.RRBP.Student
  alias School.Repo

  def index(conn, params) do
    #students = RRBP.list_students()
	page = Student
			|> Repo.paginate(params)
    #render(conn, "index.html", students: students)
	render(conn, "index.html", students: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = RRBP.change_student(%Student{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"student" => student_params}) do
    case RRBP.create_student(student_params) do
      {:ok, student} ->
        conn
        |> put_flash(:info, "Student created successfully.")
        |> redirect(to: Routes.student_path(conn, :show, student))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    student = RRBP.get_student!(id)
    render(conn, "show.html", student: student)
  end

  def edit(conn, %{"id" => id}) do
    student = RRBP.get_student!(id)
    changeset = RRBP.change_student(student)
    render(conn, "edit.html", student: student, changeset: changeset)
  end

  def update(conn, %{"id" => id, "student" => student_params}) do
    student = RRBP.get_student!(id)

    case RRBP.update_student(student, student_params) do
      {:ok, student} ->
        conn
        |> put_flash(:info, "Student updated successfully.")
        |> redirect(to: Routes.student_path(conn, :show, student))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", student: student, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    student = RRBP.get_student!(id)
    {:ok, _student} = RRBP.delete_student(student)

    conn
    |> put_flash(:info, "Student deleted successfully.")
    |> redirect(to: Routes.student_path(conn, :index))
  end
end
