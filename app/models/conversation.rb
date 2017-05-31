class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User
  belongs_to :offer, foreign_key: :offer_id, class_name: User

  validates :sender_id, uniqueness: { scope: :offer_id }

  scope :between, -> (sender_id, offer_id) do
    where(sender_id: sender_id, offer_id: offer_id).or(
      where(sender_id: offer_id, offer_id: sender_id)
    )
  end

  def self.get(sender_id, offer_id)
    conversation = between(sender_id, offer_id).first
    return conversation if conversation.present?

    create(sender_id: sender_id, offer_id: offer_id)
  end

  def opposed_user(user)
    user == offer ? sender : offer
  end

end
