class RenameColumnOfferIdInConversations < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :offer_id, :recipient_id
  end
end
