json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :author_name, :post_id
  json.url comment_url(comment, format: :json)
end
