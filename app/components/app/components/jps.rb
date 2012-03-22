class Jps < TeamingGrid

  def configuration
    super.merge(
                {  
                  :name => "jps",
                  :model => "Jp",             
                  :title => "Contract",	    
                  :load_inline_data => false,
                  :columns => [	 
                               #{:name => :id, :header => 'Teaming#', :hidden => false, :width=> 45},
                               {:name => :sbtnid, :header => 'SBTN ID'},
                               {:name => :jpco, :header => 'Company'},
                               {:name => :jptitle, :header => 'Title'},
                               {:name => :updated_at, :header => 'Date Posted'},			
                               {:name => :jploc, :header => 'Location'},	
                               {:name => :jpctype,  :header => 'Contract Type'},		
                               {:name => :jpclass, :header => 'Classification Code'},
                               {:name => :jpnaics, :header => 'NAICS Code'},	  		
                               {:name => :select, :header => 'Select'},
                               {:name => :interest,  :header=> 'Interest'},
                               {:name => :jptext,  :hidden => true},
                               {:name => :created_at,  :hidden => true},
                               {:name => :grid_type,  :hidden=> true},
                               {:name => :iedcoms,  :hidden=> true},
                               {:name => :vtp,  :hidden=> true}
                               
                               
                              ],
                  :view_config => { :force_fit => true}
                }
                )
  end
end
