require 'rails_helper'

RSpec.describe My::TimelineController, type: :request do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let(:store) { create(:store) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end

  it 'list_idが無い場合、未分類リストに登録する' do
    post my_clip_path, headers: @auth_tokens, params: { store_id: store.id }
    expect(response).to have_http_status(:success)
  end
  describe 'list_idがある場合' do
    it 'リストの作成者が自分である場合、正常に保存できること' do
      
    end
    it 'リストの共有を受けている場合、正常に保存できること' do
      
    end
    it '権限のないリストを指定した場合、エラーとなること' do
      
    end
  end
end
