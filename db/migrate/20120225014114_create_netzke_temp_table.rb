class CreateNetzkeTempTable < ActiveRecord::Migration
  def self.up
    create_table :netzke_temp_table	
  end

  def self.down
    drop_table :netzke_temp_table	
  end
end
