# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@store = Store.find_or_create_by({name: '幻想茶房'}) do |store|
  store.prefecture_id = 4
  store.address = "宮城県仙台市青葉区中央1-1-1"
  store.place = "JR仙台駅より徒歩1分"
  store.phone_number = "000-0000-0000"
end

User.find_or_create_by({email: 'store@example.com'}) do |user|
  user.store_id = @store.id
  user.official = true
  user.password = "password"
end.confirm

@user = User.find_or_create_by({email: 'test@example.com'}) do |user|
  user.password = "password"
end
@user.confirm

Article.find_or_create_by({user_id: @user.id, store_id: @store.id}) do |article|
  article.body = "SNS風にしようとするとタイトルはいらない気がするんだけどデザイン的にはタイトルほしい気がするの悩む"
end