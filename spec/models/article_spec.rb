require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { create(:user) }
  let(:store) { create(:store) }
  it '正常ケース' do
    article = Article.create({
      body: "テスト投稿",
      author_id: user.id,
      store_id: store.id
    })
    article.images.build({
      article_id: article.id,
      caption: 'キャプション',
      image_data: Shrine.uploaded_file(
        'id' => SecureRandom.hex(8),
        'storage' => 'cache',
        'metadata' => { 'mime_type' => 'image/jpeg', 'size' => 1.megabyte }).to_json
    })
    expect(article).to be_valid
  end
end
