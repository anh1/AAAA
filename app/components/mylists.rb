class Mylists < TeamingGrid

  def configuration
    current_user = User.find(session[:user_id]) 
    super.merge(
                { :itemId=> "mylists",  
                  :name => "mylists",
                  :model => "Mylist",
                  :scope => {:user_id => current_user.id},
                  :title =>"Contract",
                  :load_inline_data => false,	
                  :columns => [	 
                               #{:name => :id, :header => 'Contract ID', :hidden => true},
                               {:name => :sbtnid, :header => 'SBTN ID'},
                               {:name => :ctractitle, :header => 'Title'},
                               {:name => :ctractdate, :header => 'Date Posted'},			
                               {:name => :ctractstate, :header => 'State', :hidden => true},	
                               {:name => :ctractnoice, :header => 'Notice Type', :hidden => true},					
                               {:name => :ctractype, :header => 'Contract Type', :hidden => true},
                               {:name => :ctractclass, :header => 'Classification Code', :hidden => true},
                               {:name => :ctractnaics, :header => 'Naics Code', :hidden => true},	
                               {:name => :select, :header => 'Select'},
                               {:name => :interest,  :header=> 'Interest'},
                               {:name => :iedcoms,  :hidden => true},
                               {:name => :grid_type,  :hidden => true},
                               {:name => :record_id, :hidden => true},
                               {:name => :vtp,  :hidden => true},
                               {:name => :vtpu,  :hidden=> true}
                              ]
                }	
                )
  end

end
