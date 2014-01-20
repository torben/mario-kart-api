json.id                 cup.id
json.user_id            cup.user_id
json.winning_user_id    cup.winning_user_id
json.motor_class        cup.motor_class
json.com                cup.com
json.items              cup.items
json.num_tracks         cup.num_tracks

json.cup_members(cup.cup_members) do |cup_member|
  json.partial! 'shared/cup_member', cup_member: cup_member
end