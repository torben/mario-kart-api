json.id                 user.id
json.email              user.email
json.nickname           user.nickname
json.win_count          user.win_count
json.avatar_url         "#{request.protocol}#{request.host_with_port}#{user.avatar.url}"
json.drive_count        user.drive_count
json.total_points       user.total_points
json.points_per_race    user.points_per_race
json.last_character_id  user.last_character.try(:id)
json.last_vehicle_id    user.last_vehicle.try(:id)

json.characters(user.characters) do |character|
  json.partial! 'shared/character', character: character
end

json.vehicles(user.vehicles) do |vehicle|
  json.partial! 'shared/vehicle', vehicle: vehicle
end