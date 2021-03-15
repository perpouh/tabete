require 'rails_helper'

RSpec.describe My::TimelineController, type: :request do
  let(:user) { create(:user) }
  let(:followee) { create(:user) }
  @auth_tokens = {}
  before do
    user.confirm
    followee.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #index' do
    it 'returns http success' do
      get my_timeline_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
    context 'フォロイーがいる場合' do
      before do
        Follow.create({ followee_id: followee.id, follower_id: user.id })
        followee.articles.create({'body': 'テスト'})
      end
      it 'returns one article' do
        get my_timeline_path, headers: @auth_tokens
        expect(JSON.parse(response.body).count).to be 1
      end
    end
  end
end
