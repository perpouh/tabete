class Article < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :store, optional: true
  has_many :images, class_name: 'ArticleImage'

  validates :body, length: { in: 5..15 }

  attr_accessor :store_name

  scope :mine, ->(user) { where(author_id: user.id) }
end
