class Conversation < ApplicationRecord
  belongs_to :offer, foreign_key: :offer_id, class_name: User
  belongs_to :user, foreign_key: :user_id, class_name: User
  has_many :messages, dependent: :destroy

  validates :offer_id, uniqueness: { scope: :user_id }

  def opposed_user(user)
    user == user ? offer :user
  end
end
