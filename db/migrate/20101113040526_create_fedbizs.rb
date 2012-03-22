class CreateFedbizs < ActiveRecord::Migration
  def self.up
    create_table :fedbizs do |t|
      t.string :sbtnid
      t.string :sol_opp
      t.string :sol_num
      t.string :sol_date
      t.string :sol_state
      t.string :sol_type
      t.string :sol_naics
      t.string :sol_class
      t.string :sol_link
      t.string :sol_aside
      t.string :sol_agency
      t.string :sol_office
      t.string :sol_location
      t.string :sol_rdate     
      t.boolean :select,   :default => false
      t.boolean :interest, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :fedbizs
  end
end
