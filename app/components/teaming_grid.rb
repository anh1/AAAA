# Contract class contains onfiguration common for all 4 classes
# (components) that are displayed in south and top-right panel . All
# classes inherit from here.

class TeamingGrid < Netzke::Basepack::GridPanel

  # Common configuration for all grids inheriting from here.
   def configuration

     super.merge({
                   :persistence => true,
                   :load_inline_data => false,
                   :view_config => { :force_fit => true },
                   :scope => lambda { |rel|
                     component_session[:filter_state] ? rel.where(:select => true) : rel
                   }
                 })

   end
  
  # Most of the grids have only two buttons: search and
  # filter. Additional actions to be defined in actual classes.
  def default_bbar
    %w{apply search filter clear}.map(&:to_sym).map(&:action)
  end

  endpoint :save_filter_state do |param|
    component_session[:filter_state] = param
  end

  endpoint :clear_selection do |params|
    config[:model].constantize.update_all({ :select => false}, { :select => true})
    { :reload => true }
  end


  js_mixin :teaming_grid



  # ----------------------------------------
  # All actions
  # ----------------------------------------

  #

  action :search, :tooltip => "Advanced search"
  action :filter do
    {
      :enable_toggle => true,
      :icon => "ui-check-boxes",
      :tooltip => "Show all/only selected items" 
    }
  end

  action :clear do 
    { 
      :text => "Clear selection",
      :icon => "ui-check-box-uncheck",
      :tooltip=> "Clear all selections",
    }
  end


 end

