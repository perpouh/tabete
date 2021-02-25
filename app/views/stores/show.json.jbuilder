json.store do
  json.merge! @store.attributes
  json.official_accounts @store.official_accounts
  json.articles @articles
end