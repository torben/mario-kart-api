json.array!(@characters) do |character|
  json.partial! 'shared/character', character: character
end