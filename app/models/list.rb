class List < ApplicationRecord
  has_many :clips

  scope :mine, ->(user) { where(creator_id: user.id) }
  scope :saved, ->(user) { where(id: SavedList.where({ user_id: user.id }).map(&:list_id)) }
  scope :ours, ->(user) { mine(user).or(saved(user)) }

  scope :default_list, ->(user) { find_by(creator_id: user.id, title: '未分類') }

  validates :title, length: { in: 1..15 }

  before_create :set_id

  private

  def set_id
    self.id = SecureRandom.alphanumeric(20) while id.blank? || User.find_by(id: id).present?
  end
end
