require 'rails_helper'

RSpec.describe My::ClipsController, type: :request do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let(:store) { create(:store) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end

  it 'list_idが無くてもログインしていれば正常' do
    post my_clip_path, headers: @auth_tokens, params: { store_id: store.id }
    expect(response).to have_http_status(:success)
  end
  it 'list_idがあり、ログインしていない場合はエラー' do
    post my_clip_path, params: { list_id: list.id, store_id: store.id }
    expect(response).to have_http_status(:unauthorized)
  end
  it 'list_idがなく、ログインしていない場合はエラー' do
    post my_clip_path, params: { store_id: store.id }
    expect(response).to have_http_status(:unauthorized)
  end
end
