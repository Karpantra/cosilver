class Flat < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many :equipments, through: :flat_equipments

  validates :type, :address, :city, :service_charges, :deposit, :description, :flat_area, :max_roommmates, :number_pieces, :smoker, :animals
end
