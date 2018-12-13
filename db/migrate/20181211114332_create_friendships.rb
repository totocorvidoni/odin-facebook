class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
