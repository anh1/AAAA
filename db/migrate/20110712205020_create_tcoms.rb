class CreateTcoms < ActiveRecord::Migration
  def self.up
    create_table :tcoms do |t|
     t.references :user
     t.string :title
     t.string :business_email
     t.string :company_name
     t.string :website
     t.integer :business_phone
     t.integer :alternative_phone
     t.text :address 
     t.string :city 
     t.integer :zipcode
     t.string :duns
     t.integer :no_of_employee
     t.date :business_start_date
     t.references :business_type
     t.string :facility_clearance
     t.string :contract_experience
     t.string :product_and_service
     t.string :business_structure
     t.string :customer_focus
     t.string :industry_focus
     t.string :keywords
     t.string :naics
     t.string :classifications
     t.timestamps
    end
  end

  def self.down
    drop_table :tcoms
  end
end
