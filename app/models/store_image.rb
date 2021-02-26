class StoreImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :store
end
