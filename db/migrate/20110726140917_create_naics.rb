class CreateNaics < ActiveRecord::Migration
  def self.up
    create_table :naics do |t|
      t.string :sbtnncode
      t.string :sbtngroup
      t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :naics
  end
end
