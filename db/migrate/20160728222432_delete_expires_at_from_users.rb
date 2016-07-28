class DeleteExpiresAtFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :expires_at
  end
end
