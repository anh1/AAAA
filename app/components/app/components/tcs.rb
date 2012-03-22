class Tcs < TeamingGrid
  
  # Defines the netzke components that is loaded in the east panel when
  # the teaming is first loaded, this component loads all the Companies
  # when the refresh button at the buttom bar is clicked.
  def configuration
    super.merge(
      :model => "Tcom",
      :itemId => "Fcomponent",
      :columns => [	 
                   #{:name => :id, :header => 'Teaming#', :hidden => false, :width=> 45},
                   {:name => :coname, :header => 'Company'},
                   {:name => :coweb, :header => 'Website'},	
                   {:name => :conaics, :header => 'Naics Code'},
                   {:name => :cocft, :header => 'Classification Code'},					
                   {:name => :select, :header => 'Select'},
                   {:name => :created_at, :hidden => true},
                   {:name => :updated_at, :header => 'Date'}
                  ]
              )
  end

  def default_bbar
    res = super << :teaming.action
  end

  def default_context_menu
    [:youtube.action]
  end

  action :teaming, :icon => :users
  action :youtube do 
    { 
      :text => "Company video",
      :tooltip => "Play company's promotion video",
      :icon => "film-youtube"
    }
  end

  # Play company's Youtube video. Video should be a string in youtube
  # embed video HTTP link. 
  # For example: in '<iframe width="420" height="315" src="http://www.youtube.com/embed/vHgZCrAoqKk frameborder="0" allowfullscreen></iframe>' 
  # video ID is vHgZCrAoqKk. All the extras are trimmed from video ID on before_save in Tcom model.
  endpoint :get_video_id do |params|
    video = Tcom.find(params).try(:youtube_video)
    if video
      { :youtube_play => video }
    else
      { :youtube_missing => true }
    end
  end

  js_mixin :youtube

end
