class CreateMylists < ActiveRecord::Migration
  def self.up
    create_table :mylists do |t|
      t.string :sbtnid
      t.string :ctractitle
      t.string :ctractdate
      t.string :ctractstate
      t.string :ctractnotice
      t.string :ctractclass
      t.string :ctractnaics
      t.string :ctractype
      t.boolean :select,   :default => false
      t.boolean :interest, :default => false
      t.string :iedcoms
      t.string :grid_type
      t.string :record_id
      t.string :vtp
      t.string :vtpu
      t.string :retext
      t.string :retitle
      t.timestamps
    end
  end

  def self.down
    drop_table :mylists
  end
end
