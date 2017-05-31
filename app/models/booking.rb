class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :flat

  validates :delivered_at, presence: true
  validates :booked_at, presence: true
end
