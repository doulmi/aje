json.extract! article, :id, :title, :raw_content, :rendered_content, :level, :created_at, :updated_at
json.url article_url(article, format: :json)
