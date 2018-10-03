json.extract! tournament, :id, :name, :description, :registration_start_date, :registration_end_date, :period, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
