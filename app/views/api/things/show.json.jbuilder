json.thing do
  json.id    @thing.id
  json.title @thing.title
  json.description @thing.description
  json.published @thing.published
  json.featured @thing.featured
  json.created_at @thing.created_at
  json.updated_at @thing.updated_at

  json.type_id @thing.type ? @thing.type.id : nil
end