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
      # id未設定、または、すでに同じidのレコードが存在する場合はループに入る
      while self.id.blank? || User.find_by(id: self.id).present? do
        # ランダムな20文字をidに設定し、whileの条件検証に戻る
        self.id = SecureRandom.alphanumeric(20)
      end
    end
end
