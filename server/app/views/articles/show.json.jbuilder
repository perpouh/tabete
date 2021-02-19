json.article do
  json.merge! @article.attributes
  json.store @article.store
  json.user @article.user
end