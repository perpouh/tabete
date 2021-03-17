class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :articles, foreign_key: 'author_id'
  belongs_to :store, optional: true

  has_many :follow, foreign_key: 'follower_id'
  has_many :followees, through: 'follow'

  enum user_type: {
    general: 0,
    admin: 1
  }

  validates :name, ban_reserved: true, length: { in: 5..15 }, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :nickname, length: { in: 5..15 }

  before_validation :generate_default_name
  after_create :generate_default_list

  private

  def generate_default_name
    self.nickname = '名無しさん' if nickname.blank?
    self.name = email.split('@')[0] if name.blank?
    self
  end

  def generate_default_list
    List.create({ creator_id: id, title: '未分類' })
  end
end
