class AddIndexToConversations < ActiveRecord::Migration[5.0]
  def change
    add_index :conversations, [:offer_id, :sender_id], unique: true
  end
end
