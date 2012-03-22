class CreateNetzkenaics < ActiveRecord::Migration
  def self.up
    create_table :netzkenaics do |t|	    
      t.string :ncode
      t.string :ngroup
      t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :netzkenaics
  end
end
