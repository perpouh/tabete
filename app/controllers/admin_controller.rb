class AdminController < ActionController::Base
  # 管理者権限を必要とする画面、PC専用
  protect_from_forgery
end