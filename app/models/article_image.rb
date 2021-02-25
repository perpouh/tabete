class ArticleImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :article
end
