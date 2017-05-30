class Conversation < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  has_many :messages, dependent: :destroy

  # validates :offer_id, uniqueness: { scope: :user_id }

end
