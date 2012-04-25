class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :username, :string
    add_column :users, :state, :string
  end

  def self.down
    remove_column :users, :firstname
    remove_column :users, :username
    remove_column :users, :state
  end
end
