
class Fedbizs < TeamingGrid

   def configuration
     super.merge({
                   
                   :itemId => 'fedbiz',
                   :name => "fedbizs",
                   :model => "Fedbiz", 
                   :title => "Contract",	         
                   
                   :columns => [	 
                                #{:name => :id, :header => 'Fedbiz#', :hidden => false, :width=> 35},
                                {:name => :sbtnid, :header => 'SBTN ID'},
                                {:name => :sol_opp, :header => 'Opportunity'},
                                {:name => :sol_date, :header => 'Date Posted'},
                                {:name => :sol_aside, :header => 'Set-Aside'},
                                {:name => :sol_type, :header => 'Procurement Type'},
                                {:name => :sol_class, :header => 'Classification Code'},
                                {:name => :sol_naics, :header => 'NAICS Code'},			
                                {:name => :select, :header => 'Select'},
                                {:name => :interest,  :header=> 'Interest'}
                               ]
                   
                 })
     
   end

end
