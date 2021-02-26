class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :articles
  belongs_to :store, optional: true

  enum user_type: {
    general: 0,
    admin: 1
  }

  validates :name, ban_reserved: true, length: { in: 5..15 }, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :nickname, length: { in: 5..15 }
end
