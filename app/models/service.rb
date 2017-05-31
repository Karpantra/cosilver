class Service < ApplicationRecord
  belongs_to :provider
  has_many :bookings
  has_many :availibilities

  validates :category, presence: true
  validates :title, presence: true
  validates :price_per_hour, presence: true
  validates :address, presence: true
end
