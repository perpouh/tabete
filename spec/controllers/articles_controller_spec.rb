require 'rails_helper'

RSpec.describe ClipsController, type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end

  describe '記事一覧' do
    it 'ログインしている場合' do
      get articles_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
    it 'ログインしていない場合' do
      get articles_path
      expect(response).to have_http_status(:success)
    end
    it '検索' do
      get articles_path, params: { body_matches_all: 'テスト サンプル' }
      expect(response).to have_http_status(:success)
    end
  end

  describe '記事詳細' do
    it 'ログインしている場合' do
      get articles_path(article), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
    it 'ログインしていない場合' do
      get articles_path(article)
      expect(response).to have_http_status(:success)
    end
  end
end
