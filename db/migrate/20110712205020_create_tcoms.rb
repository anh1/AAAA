class CreateTcoms < ActiveRecord::Migration
  def self.up
    create_table :tcoms do |t|
     t.string :coname
     t.string :coweb
     t.string :conaics
     t.string :cocft    
     t.boolean :select, :default => false 
     t.string :cousername 
     t.string :conum
     t.string :coanum
     t.string :coaddress
     t.string :cocity
     t.string :cozip
     t.string :costate
     t.string :coduns
     t.string :conemn
     t.string :cobizstruct
     t.string :cobsdate
     t.string :cofclear
     t.string :cocexp
     t.string :coprodser
     t.string :cofocus
     t.string :coifocus
     t.string :cokword
      t.timestamps
    end
  end

  def self.down
    drop_table :tcoms
  end
end
