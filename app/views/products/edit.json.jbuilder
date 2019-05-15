json.array! @children do |child|
  json.name child.name
  json.id child.id
  json.ancestry child.ancestry
end