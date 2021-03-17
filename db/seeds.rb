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
  user.name = "gensousabou"
  user.nickname = "幻想茶房"
end.confirm

@takashi = User.find_or_create_by({email: 'takashi@example.com'}) do |user|
  user.password = "password"
  user.name = "takashi"
  user.nickname = "たかし"
end
@takashi.confirm

@satoshi = User.find_or_create_by({email: 'satoshi@example.com'}) do |user|
  user.password = "password"
  user.name = "satoshi"
  user.nickname = "さとし"
end
@satoshi.confirm

@yusuke = User.find_or_create_by({email: 'yusuke@example.com'}) do |user|
  user.password = "password"
  user.name = "yusuke"
  user.nickname = "ゆうすけ"
end
@yusuke.confirm

Article.find_or_create_by({author_id: @takashi.id, store_id: @store.id}) do |article|
  article.body = "たかしくんの記事そのいち"
end

Article.find_or_create_by({author_id: @satoshi.id, store_id: @store.id}) do |article|
  article.body = "さとしくんの記事"
end

# ゆうすけくんはたかしくんをフォローしています
Follow.find_or_create_by({follower_id: @yusuke.id, followee_id: @takashi.id})