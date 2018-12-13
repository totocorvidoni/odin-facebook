class CreateFriendshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendship_requests do |t|
      t.references :from, foreign_key: { to_table: :users }
      t.references :to,   foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
