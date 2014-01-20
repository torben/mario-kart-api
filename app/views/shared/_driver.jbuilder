if driver.present?
  json.id               driver.id
  json.user_id          driver.user_id
  json.win_count        driver.win_count
  json.drive_count      driver.drive_count
  json.total_points     driver.total_points
  json.points_per_race  driver.points_per_race

  if defined? with_user
    json.user do |user_json|
      user_json.partial! 'shared/user_only', user: driver.user
    end
  end

  json.character do |character_json|
    character_json.partial! 'shared/character', character: driver.character
  end

  json.vehicle do |vehicle_json|
    vehicle_json.partial! 'shared/vehicle', vehicle: driver.vehicle
  end
end