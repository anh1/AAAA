class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :company_name
      t.string :email
      t.integer :mobile_number
      t.string :subject
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
