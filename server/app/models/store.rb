class Store < ApplicationRecord
  has_many :official_accounts, -> { where(official: true) }, class_name: 'User'
end
