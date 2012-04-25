class CreateCompanyNaics < ActiveRecord::Migration
  def self.up
    create_table :company_naics do |t|
      t.references :tcom
      t.string :name,:length=>255
      t.timestamps
    end
  end

  def self.down
    drop_table :company_naics
  end
end
