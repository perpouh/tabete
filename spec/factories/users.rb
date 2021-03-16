FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "tarou#{n}" }
    sequence(:nickname) { |n| "tarousann#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'testuser' }
  end
end
