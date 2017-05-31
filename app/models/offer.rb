class Offer < ApplicationRecord
  belongs_to :flat
  validates :content, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :room_size, presence: true
end
