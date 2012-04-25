# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Role.create(:role_type=>"Consultant")
Role.create(:role_type=>"Business")
Role.create(:role_type=>"Admin")



BusinessType.create(:business_type=>"Small Business")
BusinessType.create(:business_type=>"Small Disadvantage Business")
BusinessType.create(:business_type=>"HUB Zone")
BusinessType.create(:business_type=>"Women-Owned Small Business")
BusinessType.create(:business_type=>"Competitive 8A")
BusinessType.create(:business_type=>"Service-Disabled Veteran Owned Small Business")
BusinessType.create(:business_type=>"Veteran-Owned Small Business")
BusinessType.create(:business_type=>"Not a Small Business")



#~ Naic.create(:naics_code=>1001, :naics_description=>"Soybean Farming")
#~ Naic.create(:naics_code=>1002, :naics_description=>"Oilseed Farming")
#~ Naic.create(:naics_code=>1003, :naics_description=>"Dry Pes and Bean Farming")
#~ Naic.create(:naics_code=>1004, :naics_description=>"Wheat Farming")
#~ Naic.create(:naics_code=>1005, :naics_description=>"Corn Farming")
#~ Naic.create(:naics_code=>1006, :naics_description=>"Rice Farming")
#~ Naic.create(:naics_code=>1007, :naics_description=>"Oilseed and Grain Combination Farming")



#~ Ccl.create(:classification_code=>101, :classification_description=>"Nuclear Ordanance")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Fire control equipment")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Ammunition & explosives")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Guided missiles")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Aircraft & airframe structural components")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Aircraft components & accessories")
#~ Ccl.create(:classification_code=>101, :classification_description=>"Aircraft launching landind & ground handling equipment")




State.create(:abrev=>"AL", :state=>"Alabama")
State.create(:abrev=>"Alabama", :state=>"Alaska")
State.create(:abrev=>"AS", :state=>"American Samoa")
State.create(:abrev=>"AZ", :state=>"Arizona")
State.create(:abrev=>"AR", :state=>"Arkansas")
State.create(:abrev=>"CA", :state=>"California")
State.create(:abrev=>"CO", :state=>"Colorado")
State.create(:abrev=>"CT", :state=>"Connecticut")
State.create(:abrev=>"DE", :state=>"Delaware")
State.create(:abrev=>"FL", :state=>"Florida")
State.create(:abrev=>"GA", :state=>"Georgia")
State.create(:abrev=>"GU", :state=>"Guam")
State.create(:abrev=>"HI", :state=>"Hawaii")
State.create(:abrev=>"ID", :state=>"Idaho")
State.create(:abrev=>"IL", :state=>"Illinois")
State.create(:abrev=>"IN", :state=>"Indiana")
State.create(:abrev=>"IA", :state=>"Iowa")
State.create(:abrev=>"KS", :state=>"Kansas")
State.create(:abrev=>"KY", :state=>"Kentucky")
State.create(:abrev=>"LA", :state=>"Louisiana")
State.create(:abrev=>"ME", :state=>"Maine")
State.create(:abrev=>"MH", :state=>"Marshall Island")
State.create(:abrev=>"MD", :state=>"Maryland")
State.create(:abrev=>"MA", :state=>"Massachusetts")
State.create(:abrev=>"MI", :state=>"Michigan")
State.create(:abrev=>"MN", :state=>"Minnesota")
State.create(:abrev=>"MS", :state=>"Mississippi")
State.create(:abrev=>"MO", :state=>"Missouri")
State.create(:abrev=>"MT", :state=>"Montana")
State.create(:abrev=>"NE", :state=>"Nebraska")
State.create(:abrev=>"NV", :state=>"Nevada")
State.create(:abrev=>"NH", :state=>"New Hampshire")
State.create(:abrev=>"NJ", :state=>"New Jersey")
State.create(:abrev=>"NM", :state=>"New Mexico")
State.create(:abrev=>"NY", :state=>"New York")
State.create(:abrev=>"NC", :state=>"North Carolina")
State.create(:abrev=>"ND", :state=>"North Dakota")
State.create(:abrev=>"MP", :state=>"Northern Marianan Islands")
State.create(:abrev=>"OH", :state=>"Ohio")
State.create(:abrev=>"OK", :state=>"Oklahoma")
State.create(:abrev=>"OR", :state=>"Oregon")
State.create(:abrev=>"PW", :state=>"Palau")
State.create(:abrev=>"PA", :state=>"Pennsylvania")
State.create(:abrev=>"PR", :state=>"Puerto Rico")
State.create(:abrev=>"RI", :state=>"Rhode Island")
State.create(:abrev=>"SC", :state=>"South Carolina")
State.create(:abrev=>"SD", :state=>"South Dakota")
State.create(:abrev=>"TN", :state=>"Tennessee")
State.create(:abrev=>"TX", :state=>"Texas")
State.create(:abrev=>"UT", :state=>"Utah")
State.create(:abrev=>"VT", :state=>"Vermont")
State.create(:abrev=>"VI", :state=>"Virgin Islands")
State.create(:abrev=>"VA", :state=>"Virginia")
State.create(:abrev=>"WA", :state=>"Washington")
State.create(:abrev=>"WV", :state=>"West Virginia")
State.create(:abrev=>"WI", :state=>"Wisconsin")
State.create(:abrev=>"WY", :state=>"Wyoming")






