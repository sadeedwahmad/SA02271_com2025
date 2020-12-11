json.extract! profile, :id, :name, :email, :user_id , :picture, :created_at, :updated_at
json.url profile_url(profile, format: :json)
