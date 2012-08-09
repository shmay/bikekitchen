json.(@events) do |json, event|
  json.(event, :id, :name, :time, :slots, :instructor, :created_at)
  json.day_time event.day
end
