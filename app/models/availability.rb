class Availability < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :date, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true

end
