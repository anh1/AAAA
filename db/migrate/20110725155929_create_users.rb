class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :coname
      t.string :coweb
      t.string :conaics
      t.string :cocft
      t.string :comylist
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
