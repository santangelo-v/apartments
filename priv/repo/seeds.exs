Apartments.Repo.insert!(%Apartments.Apartment{
  name: "Girasole",
  description: "Un piccolo appartamento a 150m dal mare.",
  vacancies: 5,
  location: "Alcamo"
})

margherita =
  Apartments.Repo.insert!(%Apartments.Apartment{
    name: "Villa Margherita",
    description: "Una grande villa sul mare con tante prenotazioni",
    vacancies: 10,
    location: "Castellammare del golfo"
  })

tulipano =
  Apartments.Repo.insert!(%Apartments.Apartment{
    name: "Tulipano",
    description: "Un piccolo appartmanto per due persone con poche prenotazioni",
    vacancies: 2,
    location: "Trapani"
  })

date_time_now = DateTime.truncate(DateTime.utc_now(), :second)

%{id: reservation_id} = Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-07-25"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-07-26"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-07-27"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-07-28"),
  reserved_on: date_time_now,
  apartment_id: margherita.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-08-14"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-08-15"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})

Apartments.Repo.insert!(%Apartments.Reservation{
  date: Date.from_iso8601!("2021-08-16"),
  reserved_on: date_time_now,
  apartment_id: tulipano.id
})

Apartments.Repo.insert!(%Apartments.Weather{
  reservation_id: reservation_id,
  temperature: 25,
  umidity: 70,
  is_good_weather: true
})
