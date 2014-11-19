json.array!(@users) do |user|
  json.extract! user, :id, :fisrt_name, :last_name, :email, :birthday, :role_id
  json.url user_url(user, format: :json)
end
