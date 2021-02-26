json.store do
  json.merge! @store.attributes
  json.official_accounts @store.official_accounts
  json.store_images @store.store_images do |image|
    json.src image.image_url
    json.caption image.caption
  end
  json.articles @articles
end