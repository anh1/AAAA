
class YoutubePlayer < Netzke::Basepack::Window

  def configuration
    super.merge({
                  :width  => 435,
                  :class_name => "Basepack::Window",
                  :height => 350,
                  :persistence => true,
                  :title  => "Company information",
                  :layout => 'fit',
                  :item  => {
                    :class_name => "Basepack::Panel",
                    :xtype => :panel,
                    :region => :center,
                    :margins => [5, 5, 5, 5],
                    :autoScroll => false,
                    :html => '<iframe width="420" height="315" src="http://www.youtube.com/embed/ZCCg3ZYSJxQ" frameborder="0" allowfullscreen></iframe>'
                  }
                })
  end


end

