FactoryBot.define do
  factory :article do
    user_id { 1 }
    store_id { 1 }
    body { "MyString" }
  end
end
