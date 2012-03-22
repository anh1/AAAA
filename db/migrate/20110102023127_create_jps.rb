class CreateJps < ActiveRecord::Migration
  def self.up
  create_table :jps do |t|  
      t.string :sbtnid
      t.string :jpco
      t.string :jptitle
      t.string :jploc
      t.string :jpctype
      t.string :jpclass
      t.string :jpnaics
      t.boolean :select,   :default => false
      t.boolean :interest, :default => false
      t.text :jptext
      t.string :grid_type
      t.string :iedcoms
      t.string :vtp
      t.string :vtpu  
      t.timestamps
    end
  end
  def self.down
    drop_table :jps
  end
end
