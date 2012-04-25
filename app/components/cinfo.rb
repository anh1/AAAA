class Cinfo < Netzke::Base
	

=begin
js_base_class "Ext.form.FormPanel"

js_properties :title => "Company Info",
	 :autoHeight=>true, :labelPad=>10, :bodyStyle=> 'padding:15px'
	

		
config :items=>[ 
{ :xtype=> 'textfield', :fieldLabel=>'First Name', :name=>'firstname', :id=>"fname",  :html=> "<label> Anh </label>" },
{:xtype=> 'textfield', :fieldLabel=> 'Last Name', :name=>'username', :id=>"lastname"},
{:xtype=> 'textfield', :fieldLabel=> 'Username', :name=>'email', :id=>"uname"},
{:xtype=> 'textfield', :fieldLabel=> 'Email', :name=>'email', :id=>"email"},
{:xtype=> 'textfield', :fieldLabel=> 'Login', :name=>'ulogin', :id=>"ulogin"},
{:xtype=> 'textfield', :fieldLabel=> 'Password', :name=>'pword', :id=>"pword"},
{:xtype=> 'textfield', :fieldLabel=> 'Retype password', :name=>'retypp', :id=>"retypp"},
{:xtype=> 'textfield', :fieldLabel=> 'Company Name', :name=>'cname', :id=>"cname"},
{:xtype=> 'textfield', :fieldLabel=> 'Website', :name=>'cweb', :id=>"cweb"},
{:xtype=> 'textfield', :fieldLabel=> 'Business Phone #', :name=>'bphone', :id=>"bphone"},
{:xtype=> 'textfield', :fieldLabel=> 'Alternate Phone #', :name=>'aphone', :id=>"aphone"},
{:xtype=> 'textfield', :fieldLabel=> 'Address', :name=>'address', :id=>"address"},
{:xtype=> 'textfield', :fieldLabel=> 'City', :name=>'city', :id=>"city"},
{:xtype=> 'textfield', :fieldLabel=> 'Zip Code', :name=>'zipcode', :id=>"zipcode"},
{:xtype=>'combo',:id=>'statesc', :name=>'statesc',:fieldLabel=>'State', :mode=>'local', :store=> ['Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois',
'Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire',
'New Jersey','New Mexico','New York','Non-U.S','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico',
'Rhode Island','South Carolina','South Dakota','Tennessee','Texas','U.S. Virgin Islands','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming']},
{:xtype=> 'textfield', :fieldLabel=> 'Duns#', :name=>'duns', :id=>"duns"},
{:xtype=>'checkboxgroup', :id=>'gst',:name=>'FJR', :columns=>2, :fieldLabel=>'Business Type',:width=>580, :items=>[{:boxLabel=> 'Small Business', :name=> 'sml', :value=>0},{:boxLabel=> 'Small Disadvantage Business', :name=> 'sml', :value=>1},{:boxLabel=> 'HUB Zone', :name=> 'HUB', :value=>2},{:boxLabel=> 'Women-Owned Small Business',:name=> 'WO-Zone', :value=>3},{:boxLabel=> 'Competitive 8A', :name=> 'coml', :value=>4},{:boxLabel=> 'Service-Disabled Veteran Owned Small Business', :name=> 'hbcu', :value=>5},{:boxLabel=> 'Veteran-Owned Small Business', :name=> 'v-ol', :value=>6}]},
{:xtype=> 'textfield', :fieldLabel=> 'Number of Employer(s)', :name=>'nue', :id=>"nue"},
{:xtype=> 'textfield', :fieldLabel=> 'Business Start Date', :name=>'bsd', :id=>"bsd"},
#{:xtype=> 'textfield', :fieldLabel=> 'Facility Clearance', :name=>'fc', :id=>"fc"},
#{:xtype=> 'textfield', :fieldLabel=> 'Contract Experience', :name=>'cx', :id=>"cx"},
{:xtype=>'combo',:id=>'fc', :name=>'facility',:fieldLabel=>'Facility Clearance', :mode=>'local', :width=>60, :store=> ['Yes','No']},
{:xtype=>'combo',:id=>'cx', :name=>'Contract',:fieldLabel=>'Contract Experience', :mode=>'local', :width=>60, :store=> ['Yes','No']},
{:xtype=> 'textfield', :fieldLabel=> 'Product and Service', :name=>'ps', :id=>"ps", :width=>250},
{:xtype=> 'textfield', :fieldLabel=> 'Business Structure', :name=>'bstruct', :id=>"bstruct", :width=>250},
{:xtype=> 'textfield', :fieldLabel=> 'Customer Focus', :name=>'cfocus', :id=>"cfocus", :width=>250},
{:xtype=> 'textfield', :fieldLabel=> 'Industry Focus', :name=>'ifocus', :id=>"ifocus", :width=>250},
{:xtype=> 'textfield', :fieldLabel=> 'Keywords', :name=>'skword', :id=>"skword", :width=>250},


	
	
	 { :itemid=> 'naics',
	 
              :name => "fedbizs",
              :class_name => "Netzke::Basepack::GridPanel",
              :model => "Naic",             
              :title => "Naic Codes", :width=>550, :height=>250,
	      :columns => [
	                {:name=>:sbtnncode, :header=>'Naics Code',:editable=>false},
			{:name=>:sbtngroup, :header=>'Description',:editable=>false},
			{:name=>:select, :header=>'Select',:editable=>false}
			]
	      
	      
	      
	      },

{ :itemId=> 'cls',
              :name => "cls",
              :class_name => "Netzke::Basepack::GridPanel",
              :model => "Ccl",
            	:edit=>false,      
              :title => "Classification Codes", :width=>550, :height=>250,
	      :columns => [
	            
	                {:name=>:sbtnccftcode, :header=>'Classification Code',:editable=>false},
			{:name=>:sbtnccft, :header=>'Description',:editable=>false},
			{:name=>:select, :header=>'Select',:editable=>false}]
	            
	      },
	      
	{:xtype=> 'button', :fieldLabel=> 'Submit', :id=>'submit', :name=>'submit', :width=>50},
	{:xtype=> 'button', :fieldLabel=> 'Login', :id=>'login', :name=>'login', :width=>50} 
	
	]    

endpoint :company_info do |params|
	
	
	@user_create=User.create(:login=>params[:login], :password=>params[:pword], :coname=>params[:coname],:coweb=>params[:coweb], 
	:conaics=>params[:ndata], :cocft=>params[:cdata], :comylist=>params[:uname])	
	@user_create.save
	
	@tcom_create=Tcom.create(:coname=>params[:coname], :coweb=>params[:coweb], :conaics=>params[:ndata],:cocft=>params[:cdata],
	:cousername=>params[:uname],:conum=>params[:bpnum], :coanum=>params[:apnum],:coaddress=>params[:adres], :cocity=>params[:cocity],
	:cozip=>params[:zcode], :costate=>params[:cstate],:coduns=>params[:duns],:conemn=>params[:numE], :cobizstruct=>params[:bizstruct],
	:cobsdate=>params[:bizsd], 	:cofclear=>params[:fclear],:cocexp=>params[:cexp], :coprodser=>params[:prodser],
	:cofocus=>params[:cfocus],:coifocus=>params[:ifocus],:cokword=>params[:kword])	
	@tcom_create.save
	
	
   
	
	
	
	
	 
end





action :submit, :text=>'Submit'


js_method :init_component, <<-JS
    function() {
    // calling superclass's initComponent 
      
     #{js_full_class_name}.superclass.initComponent.call(this); 
      pcopsbtn=[];
      pcopsbtn1=[];
      ncopsbtn=[];
      ncopsbtn1=[];
      
    collectclassrecord=1;      
    Ext.getCmp('submit').on('click', this.onSubmit, this);
    Ext.getCmp('login').on('click', this.onRedirect,this);
    

    }
    JS
    
    
 js_method :on_redirect, <<-JS   

function(self) {
window.location="homes"

}

JS

js_method :on_submit, <<-JS
function(self) {
    aset=Ext.getCmp('gst').getValue();
    
	 asdata = [];
	Ext.each(aset, function (aset, index){asdata.push(aset.boxLabel)
	});
	
  

  function fsbtnnas(){
     var sbtnnas=[];    
    Ext.each(ncopsbtn, function (ncopsbtn, index){
	sbtnnas.push(ncopsbtn+"--"+ncopsbtn1[index]);
	});    
    return sbtnnas.join("; ");
 }
	
function fsbtncls(){
     var sbtncls=[];    
    Ext.each(pcopsbtn, function (pcopsbtn, index){
	sbtncls.push(pcopsbtn+"--"+pcopsbtn1[index]);
	});    
    return sbtncls.join("; ");
 }
	


var conaics=fsbtnnas();
var cocls = fsbtncls();

  
   this.companyInfo({fname:Ext.getCmp('fname').getValue(),
                            lname:Ext.getCmp('lastname').getValue(),
			    uname:Ext.getCmp('uname').getValue(),			    
			    email:Ext.getCmp('email').getValue(),
			    pword:Ext.getCmp('pword').getValue(), 
			    login:Ext.getCmp('ulogin').getValue(), 
			    repword:Ext.getCmp('retypp').getValue(), 
			    coname:Ext.getCmp('cname').getValue(),
			    coweb:Ext.getCmp('cweb').getValue(),
			    bpnum:Ext.getCmp('bphone').getValue(), 
			    duns: Ext.getCmp('duns').getValue(), 			    
			    apnum:Ext.getCmp('aphone').getValue(),
			    cocity:Ext.getCmp('city').getValue(), 
			    adres:Ext.getCmp('address').getValue(), 
			    zcode:Ext.getCmp('zipcode').getValue(),
                            cstate:Ext.getCmp('statesc').getValue(),
			    numE:Ext.getCmp('nue').getValue(),
			    bizsd:Ext.getCmp('bsd').getValue(),
			    fclear:Ext.getCmp('fc').getValue(),
			    cexp:Ext.getCmp('cx').getValue(),
			    prodser:Ext.getCmp('ps').getValue(),
		            bizstruct:Ext.getCmp('bstruct').getValue(),
		            cfocus:Ext.getCmp('cfocus').getValue(),
			    ifocus:Ext.getCmp('ifocus').getValue(),
			    kword:Ext.getCmp('skword').getValue(),
			    aside:asdata, 
			    ndata:conaics,
			    cdata:cocls});
  
    
    
    
    
    
    

    


}																	
    JS
=end

end





	
	
	
	
	
	
	
	
	
	
	
	
	
	

