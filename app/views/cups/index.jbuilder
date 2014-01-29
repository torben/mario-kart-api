json.array!(@cups) do |cup|
  json.partial! 'shared/cup', cup: cup, only_with_points: true
end