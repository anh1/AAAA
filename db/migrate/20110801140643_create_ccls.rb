class CreateCcls < ActiveRecord::Migration
 def self.up
    create_table :ccls do |t|
      t.string  :sbtnccft
      t.string  :sbtnccftcode
       t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :ccls
  end
end
