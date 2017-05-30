class Flat < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :offers
  has_many :equipments, through: :flat_equipments


  mount_uploader :photo, PhotoUploader


  validates :category, presence: true
  validates :address, presence: true
  validates :city, presence: true
  # :address, :city, :service_charges, :deposit, :description, :flat_area, :max_roommmates, :number_pieces, :smoker, :animals

end
