class RenameUserIdFromConversationsToSenderId < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :user_id, :sender_id
  end
end
