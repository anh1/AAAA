class CreateCcls < ActiveRecord::Migration
 def self.up
    create_table :ccls do |t|
      t.integer  :classification_code
      t.string  :classification_description
       t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :ccls
  end
end
