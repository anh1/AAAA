class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :content
      t.integer :topic_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
