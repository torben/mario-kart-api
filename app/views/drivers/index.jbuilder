json.array!(@drivers) do |driver|
  json.partial! 'shared/driver', driver: driver, with_user: true
end