class RemoveOfferRecipientIdFromConversationsAndAddUserRecipientIdToConversations < ActiveRecord::Migration[5.0]
  def change
    remove_column :conversations, :recipient_id
    add_reference :conversations, :recipient, references: :users, index: true
    add_foreign_key :conversations, :users, column: :recipient_id
  end
end
