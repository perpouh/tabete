require 'rails_helper'

RSpec.describe ListsController, type: :request do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #show' do
    it 'returns http success' do
      get list_path(list), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create' do
    it 'returns http success' do
      post lists_path, headers: @auth_tokens, params: { list: attributes_for(:list) }
      expect(response).to have_http_status(:success)
    end
  end
end
