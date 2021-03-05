class List < ApplicationRecord
  has_many :clips

  scope :ours, ->(user) { where(creator_id: user.id).or(SavedList.where({user_id: user.id}).map(&:list_id)) }
end
