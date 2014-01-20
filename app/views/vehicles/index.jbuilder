json.array!(@vehicles) do |vehicle|
  json.partial! 'shared/vehicle', vehicle: vehicle
end