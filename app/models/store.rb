class Store < ApplicationRecord
  has_many :official_accounts, -> { where(official: true) }, class_name: 'User'
  has_many :articles
  has_many :store_images

  accepts_nested_attributes_for :store_images

  include Prefecture
end
