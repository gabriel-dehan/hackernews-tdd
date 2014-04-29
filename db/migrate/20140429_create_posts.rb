class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url, null: false
      t.string :name, null: false
      t.integer :rating, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
