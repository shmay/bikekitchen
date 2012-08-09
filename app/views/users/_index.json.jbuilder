json.(@users) do |json, user|
  json.(user, :id, :email, :name, :admin, :created_at)
end
