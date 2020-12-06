json.extract! task, :id, :name, :description, :start_time, :end_time , :complete, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
