class Flat < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many :flat_equipments
  has_many :equipments, through: :flat_equipments

  validates :category, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :service_charges, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :deposit, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :photos, presence: true
  # :address, :city, :service_charges, :deposit, :description, :flat_area, :max_roommmates, :number_pieces, :smoker, :animals

  # Photo
  has_attachments :photos, minimum: 3, maximum: 5

end
