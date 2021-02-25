class Article < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :images, class_name: 'ArticleImage'
end
