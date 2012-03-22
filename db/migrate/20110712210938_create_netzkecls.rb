class CreateNetzkecls < ActiveRecord::Migration
  def self.up
    create_table :netzkecls do |t|
      t.string  :ccftcode
      t.string  :ccft
       t.boolean :select,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :netzkecls
  end
end
