class CreateSetas < ActiveRecord::Migration
  def self.up
    create_table :setas do |t|
      t.string :seta
      t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :setas
  end
end
