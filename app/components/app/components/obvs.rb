class Obvs < TeamingGrid

  def configuration

    super.merge(
                { itemId: "obvs",
                  
                  :name => "obvs",
                  :class_name => "Basepack::GridPanel",
                  :model => "Obv",
                  :title =>"Contract",
                  :load_inline_data => false,

                  :columns => [	 
                               #{:name => :id, :header => 'Teaming#', :hidden => false, :width=> 45},
                               {:name => :sbtnid, :header => 'SBTN ID'},
                               {:name => :jpco, :header => 'Company'},
                               {:name => :jptitle, :header => 'Title'},
                               {:name => :updated_at, :header => 'Date Posted'},			
                               {:name => :jploc, :header => 'Location', :hidden => true},	
                               {:name => :jpctype,  :header => 'Contract Type', :hidden => true},		
                               {:name => :jpclass, :header => 'Classification Code', :hidden => true},
                               {:name => :jpnaics, :header => 'NAICS Code', :hidden => true},	  		
                               {:name => :select, :header => 'Select'},
                               {:name => :interest,  :header=> 'Interest'},
                               {:name => :jptext,  :hidden => true},
                               {:name => :created_at,  :hidden => true},
                               {:name => :grid_type,  :hidden=> true},
                               {:name => :iedcoms,  :hidden=> true},
                               {:name => :vtp,  :hidden=> true}
                               
                               
                              ]
                  
                }
                )
  end

end
