class Book < ApplicationRecord
  # For One Attachments
  has_one_attached :cover_page
  # For Many Attachments
  has_many_attached :files
end
