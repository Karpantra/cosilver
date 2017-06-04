class Offer < ApplicationRecord
  belongs_to :flat
  validates :content, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :title, presence: true
  validates :room_size, presence: true, numericality: { greater_than_or_equal_to: 1 }
  has_attachments :photos, maximum: 3
end
