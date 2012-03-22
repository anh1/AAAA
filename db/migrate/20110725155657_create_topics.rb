class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :name
      t.text :content
      t.integer :last_poster_id
      t.integer :forum_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
