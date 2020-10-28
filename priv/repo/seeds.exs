# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Apartments.Repo.insert!(%Apartments.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Apartments.Repo.insert!(%ApartmentsWeb.Apartment{
  name: "Girasole",
  description: "Un piccolo appartamento a 150m dal mare.",
  vacancies: 5
})

margherita =
  Apartments.Repo.insert!(%ApartmentsWeb.Apartment{
    name: "Villa Margherita",
    description: "Una grande villa sul mare con tante prenotazioni",
    vacancies: 10
  })

tulipano =
  Apartments.Repo.insert!(%ApartmentsWeb.Apartment{
    name: "Tulipano",
    description: "Un piccolo appartmanto per due persone con poche prenotazioni",
    vacancies: 2
  })

date_time_now = DateTime.truncate(DateTime.utc_now(), :second)

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-07-25"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-07-26"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-07-27"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-07-28"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-08-14"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-08-15"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})

Apartments.Repo.insert!(%ApartmentsWeb.Reservation{
  date: Date.from_iso8601!("2021-08-16"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})
