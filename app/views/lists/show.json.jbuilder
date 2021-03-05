json.list do
  json.merge! @list.attributes
  json.clips @list.clips do |clip|
    json.merge! clip.attributes
  end
end