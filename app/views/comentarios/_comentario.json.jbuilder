json.extract! comentario, :id, :causa_id, :usuario_id, :data, :comentario, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)