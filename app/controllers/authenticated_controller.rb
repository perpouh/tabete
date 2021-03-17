# ユーザー権限
class AuthenticatedController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  include DeviseTokenAuth::Concerns::SetUserByToken
end