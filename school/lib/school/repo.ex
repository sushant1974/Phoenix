defmodule School.Repo do
  use Ecto.Repo,
    otp_app: :school,
    adapter: Ecto.Adapters.Postgres
	use Scrivener, page_size: 4
end
