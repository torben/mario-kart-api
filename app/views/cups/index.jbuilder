json.array!(@cups) do |cup|
  json.partial! 'shared/cup', cup: cup
end