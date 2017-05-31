class Availabilty < ApplicationRecord
  belongs_to :service

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
