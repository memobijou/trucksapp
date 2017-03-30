json.extract! outgoing_good, :id, :truck_id, :request_number, :delivery_note_number, :created_at, :updated_at
json.url outgoing_good_url(outgoing_good, format: :json)