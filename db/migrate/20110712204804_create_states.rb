class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :abrev    
      t.string :state    
      t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
