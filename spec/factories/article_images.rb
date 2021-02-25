FactoryBot.define do
  factory :article_image do
    article_id { 1 }
    image { "MyText" }
    caption { "MyString" }
  end
end
