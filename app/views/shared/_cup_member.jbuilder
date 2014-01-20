json.id           cup_member.id
json.user_id      cup_member.user_id
json.cup_id       cup_member.cup_id
json.vehicle_id   cup_member.vehicle_id
json.character_id cup_member.character_id
json.state        cup_member.state
json.placement    cup_member.placement
json.points       cup_member.points

json.user do |user_json|
  user_json.partial! 'shared/user_only', user: cup_member.user
end

if cup_member.character.present?
  json.character do |character_json|
    character_json.partial! 'shared/character', character: cup_member.character
  end
end

if cup_member.vehicle.present?
  json.vehicle do |vehicle_json|
    vehicle_json.partial! 'shared/vehicle', vehicle: cup_member.vehicle
  end
end