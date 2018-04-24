class ChangeDatatypePasswordUserId < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :password, :integer
    change_column :posts, :user_id, :integer
  end
end
