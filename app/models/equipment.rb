class Equipment < ApplicationRecord
  belongs_to :flat, through: :flat_equipments
end
