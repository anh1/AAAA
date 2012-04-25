class CreateNaics < ActiveRecord::Migration
  def self.up
    create_table :naics do |t|
      t.string :naics_code
      t.string :naics_description
      t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :naics
  end
end
