json.extract! employee_supervisor, :id, :employee_id, :supervisor_id, :priority, :created_at, :updated_at
json.url employee_supervisor_url(employee_supervisor, format: :json)