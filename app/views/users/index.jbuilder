json.array!(@users) do |user|
  json.partial! 'shared/user', user: user
end