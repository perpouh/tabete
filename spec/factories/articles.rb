FactoryBot.define do
  factory :article do
    association :author, factory: :user
    association :store
    body { "MyString" }
  end
end
