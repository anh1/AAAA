
class HelloWorldComponent < Netzke::Base
      # Ext.Panel's config option "title"
      #js_property :title, "My Hello World Component"
def default_config


	 
 super.merge(  :id=>"ContactInfo",  title:'Additional Info.',:closeAction=>'hide', :class_name => "Netzke::Basepack::Window", :header=>false, :layout=>'fit', 
:items => [ {xtype:'tabpanel', :id=>'tabw',:activeTab=>0,  
items: [    
	    {:class_name => "Netzke::Basepack::GridPanel",:title=>"Naics Code", :model => "Naic", :header => false, :border => true,
:load_inline_data => false},

{:class_name => "Netzke::Basepack::GridPanel",:title=>"Classification Code", :model => "Ccl", :header => false, :border => true ,
:load_inline_data => false},
{:class_name => "Netzke::Basepack::GridPanel",:title=>"States", :model => "State", :header => false, :border => true ,
:load_inline_data => false},

{:class_name => "Netzke::Basepack::GridPanel",:title=>"Set Aside", :model => "Seta", :header => false, :border => true ,
:load_inline_data => false}

]}]
      
   
)

end


js_method :init_component, <<-JS
    function() {
    // calling superclass's initComponent
    #{js_full_class_name}.superclass.initComponent.call(this);
    
 
 	var genres = new Ext.data.SimpleStore({
fields: ['id', 'genre'],
data : [['1','Other'],['2','Joint Venture'],['3','Prime-Sub'],['4','Contracting'],['5','Subcontracting']]
});    
	
   var formPanel =  {
        xtype       : 'form',
        autoScroll  : false,
	header: false,
	border:false,
        id          : 'formpanel',
        defaultType : 'field',
        frame       : false,
        title       : 'form panel',
        items       : [
            {  
            fieldLabel: 'Title',name: 'Title', anchor: '100%'
		
            },
            {   
	    
	    xtype: 'htmleditor', name: 'description',hideLabel: true, anchor: '100%'   
            },
	    
	    {xtype: 'radiogroup',  name: 'frm',items: [{boxLabel: 'Private', name: 'frm', inputValue: 0}, {boxLabel: 'Public', name: 'frm', inputValue: 1}],anchor: '100%'  },
	    
	   {xtype: 'combo',name: 'Interest',fieldLabel: 'Interest',mode: 'local',store: genres,displayField:'genre',width: 120},
	   
	   	{buttons: [{text:'submit', disabled:false,formBind: true,handler: function() { Ext.getCmp('pwin').hide(); }}, {text:'cancel'} ] }
	    
        ]

   
      
	

    };
    
 

 
 
 
 
 
 
 
 //Ext.getCmp('pform').add(formPanel);

    }
    JS














end
