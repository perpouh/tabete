# https://qiita.com/mtoyopet/items/ed1bd4b9c1544d401880
module AuthorizationSpecHelper
  def sign_in(user)
    post '/auth/sign_in',
      params: { email: user.email, password: user.password }
    response.headers.slice('client', 'access-token', 'uid')
  end
end