class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User
  
  enum user_type: {
    general: 0,
    admin: 1
  }
end
