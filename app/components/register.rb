class Register < Netzke::Basepack::BorderLayoutPanel
	js_base_class "Ext.form.FormPanel"
  js_base_class "Ext-all"

  def configuration
    super.merge(
      :header => true,
			:title=>"<center>Registration Page</center>",
			:height => 1000,
			:id=>"xxx",
      :items => [
			
				{
					:border=>1,
          :class_name => "Netzke::Basepack::FormPanel",
          :model => "User",
          :region => :north,
          :title => "Registration as",
					:height=>70,
					:bbar=>false,
					:layout=>:hbox, :defaults => {:width => 200},
					:items=>[:xtype=>'radiogroup', :bodyStyle=>'padding:25px', :defaults=> {:xtype=> "radio",:name=> "role"},:items=>[{:boxLabel=>"Consultant", :inputValue=>"cons", :id=>"cons1", :role_id=>1}, {:inputValue=>"busi", :id=>"busi", :boxLabel=>"Business", :role_id=>2}]]
				},
			  {
					:border=>1,
					:id=>"user_info",
          :class_name => "Netzke::Basepack::FormPanel",
          :model => "User",
          :region => :center,
					#:prohibit_update=>true,
					:collapsible=>true,
          :title => "User Information",
					:bodyStyle=> 'padding:5px 5px 0',
					:height=>200,
					:labelWidth=>100,
					:bbar=>false,
					:layout=>:hbox, 
					:items=>[{:border=>false, :defaults => {:width => 300, :allowBlank=>false}, :xtype=>:fieldset, :items=>[{:name=>:firstname, :minLength=>4},{:name=>:email, :vtype=>"email"},{:name=>:username, :minLength=>5, :maxLength=>15}, :state, {:xtype=> 'button', :id=>'submit', :text=>"Submit", :width=>70}]}, {:bodyStyle=> 'margin:5px 240px 0', :border=>false, :items=>[{:bodyStyle=> 'margin:10px 25px 0', :border=>true, :defaults => {:width => 300, :allowBlank=>false}, :xtype=>:fieldset, :title=>"Password", :items=>[{:name=>:password, :inputType=>'password', :minLength=>8, :maxLength=>25},{:name=>:retype_password, :inputType=>'password', :initialPassField=> 'password', :minLength=>8, :maxLength=>25}]}]}]
        },
				{
				  :border=>1,
					:id=>"company_info",
          :class_name => "Netzke::Basepack::FormPanel",
          :model => "Tcom",
          :title => "Company Information",
          :height => 700,
					:region =>:south,
					:bbar=>false,
					:layout=>:hbox, 
					:items => [{:border=>false, :defaults=>{:width=>300, :allowBlank=>false}, :width=>660, :xtype=>:fieldset, :items=>[{:name=>:title, :minLength=>5},{:name=>:company_name, :minLength=>6},{:name=>:business_email, :vtype=>:email},{:name=>:website, :vtype=>:url},{:name=>:business_phone, :allowDecimals=>false, :allowNegative=>false},{:name=>:alternative_phone, :allowDecimals=>false, :allowNegative=>false},{:name=>:address, :minLength=>20, :maxLength=>200}, :city, {:name=>:zipcode, :allowDecimals=>false, :allowNegative=>false}, {:name=>:company_state}, :duns, {:name=>:no_of_employee, :allowNegative=>false}, {:name=>:business_start_date, :width=>180},
					{
					:border=>1,
					:class_name=>"Netzke::Basepack::GridPanel",
					:model=>"Naic",
					:title=>"Naics Code",
					:rows_per_page => 10,
					:height => 250,
					:width => 600,
					:bbar => nil,
					:columns => [{:name=>:naics_code,:width=>138, :editable=>false}, {:name=>:naics_description, :label=>"Description", :width=>400, :editable=>false}, :select]
			}
			]}, 
			{:border=>false, :defaults=>{:width=>300, :allowBlank=>false}, :width=>660, :xtype=>:fieldset, :items=>[{:labelWidth=> 75, :xtype=>:fieldset, :title=>'Business Type', :width=>480, :items=>[{:xtype=>'radiogroup', :defaults=> {:xtype=> "radio",:name=> "businesstypes"}, :layout=>:hbox, :border=>true, :items=>[{:border=>false, :items=>[{:boxLabel=> 'Small Business', :value=>0},{:boxLabel=> 'Small Disadvantage Business', :value=>1},{:boxLabel=> 'HUB Zone', :value=>2},{:boxLabel=> 'Women-Owned Small Business', :value=>3}]},{:border=>false, :items=>[{:boxLabel=> 'Competitive 8A', :value=>4},{:boxLabel=> 'Service-Disabled Veteran Owned Small Business', :value=>5},{:boxLabel=> 'Veteran-Owned Small Business', :value=>6}]}]}]},{:xtype=>"combo", :store=> [['val1', 'Yes'], ['val2','No']], :width=>180, :name=>:facility_clearance},{:xtype=>"combo",:width=>180, :autoSelect=>false, :name=>:contract_experience, :store=>[['val1', 'Yes'],['val2','No']]}, :product_and_service, :business_structure, :customer_focus, :industry_focus, :keywords, 		
			{
					:class_name=>"Netzke::Basepack::GridPanel",
					:model=>"Ccl",
					:title=>"Classification Code",
					:rows_per_page => 10,
					:border=>1,
					:height => 250,
					:width => 600,
					:collapsible=>true,
					:bbar => nil,
					:columns => [{:name=>:classification_code, :width=>138, :editable=>false}, {:name=>:classification_description, :label=>"Description", :width=>400, :editable=>false}, :select]
			}]}
				]
				}
			]
		)
	end
	
	endpoint :user_info do |params|

		@user=User.create(:firstname=>params[:firstname], :email=>params[:email], :username=>params[:username],:state=>params[:state], 
		:password=>params[:password], :retype_password=>params[:retype_password])	
		@user.save
	
	end

	endpoint :company_info do |params|
		
		@tcom=Tcom.create(:title=>params[:title], :business_email=>params[:business_email], :company_name=>params[:company_name],:website=>params[:website],
		:business_phone=>params[:business_phone],:alternative_phone=>params[:alternative_phone], :address=>params[:address],:city=>params[:city], :zipcode=>params[:zipcode],
		:company_state=>params[:company_state], 	:duns=>params[:duns],:no_of_employee=>params[:no_of_employee], :business_start_date=>params[:business_start_date],
		:facility_clearance=>params[:facility_clearance],:contract_experience=>params[:contract_experience],:product_and_service=>params[:product_and_service], :business_structure=>params[:business_structure], :customer_focus=>params[:customer_focus],:industry_focus=>params[:industry_focus], :keywords=>params[:keywords])	
		@tcom.save
	
	end

	action :submit, :text=>'Submit'
	
	js_method :init_component, <<-JS
    function() {
    // calling superclass's initComponent 
      
     #{js_full_class_name}.superclass.initComponent.call(this); 

    Ext.getCmp('submit').on('click', this.onSubmit, this);

    }
    JS
		
	js_method :on_submit, <<-JS
	  function(self) {
		//alert("submit clicked");
							//alert(Ext.getCmp('ext-comp-1007').getValue());

   this.userInfo({ 
					firstname:Ext.getCmp('ext-comp-1007').getValue(),
					email:Ext.getCmp('ext-comp-1008').getValue(),
			    username:Ext.getCmp('ext-comp-1009').getValue(),			    
			    state:Ext.getCmp('ext-comp-1010').getValue(),
			    password:Ext.getCmp('ext-comp-1013').getValue(), 
			    retype_password:Ext.getCmp('ext-comp-1014').getValue(),
	});

   this.companyInfo({ 	
					title:Ext.getCmp('ext-comp-1018').getValue(),
					business_email:Ext.getCmp('ext-comp-1020').getValue(),
			    company_name:Ext.getCmp('ext-comp-1019').getValue(),			    
			    website:Ext.getCmp('ext-comp-1021').getValue(),
			    business_phone:Ext.getCmp('ext-comp-1022').getValue(), 
			    alternative_phone:Ext.getCmp('ext-comp-1023').getValue(),
					
					address:Ext.getCmp('ext-comp-1024').getValue(),
					city:Ext.getCmp('ext-comp-1025').getValue(),
			    zipcode:Ext.getCmp('ext-comp-1026').getValue(),			    
			    company_state:Ext.getCmp('ext-comp-1027').getValue(),
			    duns:Ext.getCmp('ext-comp-1028').getValue(), 
			    no_of_employee:Ext.getCmp('ext-comp-1029').getValue(),	
					
					business_start_date:Ext.getCmp('ext-comp-1030').getValue(),
					facility_clearance:Ext.getCmp('ext-comp-1065').getValue(),
			    contract_experience:Ext.getCmp('ext-comp-1066').getValue(),			    
			    product_and_service:Ext.getCmp('ext-comp-1067').getValue(),
			    business_structure:Ext.getCmp('ext-comp-1068').getValue(), 
			    customer_focus:Ext.getCmp('ext-comp-1069').getValue(),	
					
			    industry_focus:Ext.getCmp('ext-comp-1070').getValue(), 
			    keywords:Ext.getCmp('ext-comp-1071').getValue(),
	});
	Ext.getCmp('user_info').form.submit({
	  company_info:Ext.getCmp('company_info').form.submit(),
			waitMsg: 'Processing...',
		success: function(form,action){
			Ext.Msg.alert('Info',action.result.info);
			}
	});

}	

    JS
end
