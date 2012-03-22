class Teaming4< Netzke::Base
	
js_base_class "Ext.form.FormPanel"

js_properties :title => "Company Info",
	 :autoHeight=>true, :labelPad=>10, :bodyStyle=> 'padding:15px',
	
hideLabels: false,
    labelAlign: 'left',   
    labelWidth: 75,       
    labelPad: 8
	
		
config :items=>[ 
{ xtype: 'textfield', fieldLabel:'First Name', name:'first-name', id:"fname"   },
{xtype: 'textfield', fieldLabel: 'Last Name', name:'last-name', id:"lastname"},
{xtype: 'textfield', fieldLabel: 'Username', name:'uname', id:"uname"},
{xtype: 'textfield', fieldLabel: 'Email', name:'email', id:"email"},
{xtype: 'textfield', fieldLabel: 'Password', name:'password', id:"password"},
{xtype: 'textfield', fieldLabel: 'Retype password', name:'retypp', id:"rpassword"},
{xtype: 'textfield', fieldLabel: 'Company Name', name:'cname', id:"cname"},
{xtype: 'textfield', fieldLabel: 'Website', name:'cweb', id:"cweb"},
{xtype: 'textfield', fieldLabel: 'Phone', name:'phone', id:"phone"},
{xtype: 'textfield', fieldLabel: 'Address', name:'address', id:"address"},
{xtype: 'textfield', fieldLabel: 'Zip Code', name:'zipcode', id:"zipcode"},
{xtype:'combo',id:'statesc', name:'statesc',fieldLabel:'State', mode:'local', store: ['Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois',
'Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire',
'New Jersey','New Mexico','New York','Non-U.S','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico',
'Rhode Island','South Carolina','South Dakota','Tennessee','Texas','U.S. Virgin Islands','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming']},
{:xtype=>'checkboxgroup', :id=>'gst',:name=>'FJR', :columns=>2, fieldLabel:'Business Type',:items=>[{boxLabel: 'Small Business', name: 'sml', value:0},{boxLabel: 'HUB', name: 'HUB', value:1},{boxLabel: 'Women-Owned Zone',name: 'WO-Zone', value:2},{boxLabel: 'Competitive 8A', name: 'coml', value:3},{boxLabel: 'Veteran-Owned', name: 'v-ol', value:4},{boxLabel: 'HBCU', name: 'hbcu', value:5}]},
{xtype: 'textfield', fieldLabel: 'Number of Employer(s)', name:'nue', id:"nue"},
{xtype: 'textfield', fieldLabel: 'Year(s) in Business', name:'yib', id:"yib"},
{xtype: 'textfield', fieldLabel: 'Facility Clearance', name:'fc', id:"fc"},
{xtype: 'textfield', fieldLabel: 'Contract Experience', name:'cx', id:"cx"},


 { itemId: 'naics',
              :name => "fedbizs",
              :class_name => "Netzke::Basepack::GridPanel",
              :model => "Naic",             
              :title => "Naic Codes", :width=>450, :height=>250,
	      :columns => [
	                {:name=>:sbtnncode, :header=>'Naics Code',:editable=>false},
			{:name=>:sbtngroup, :header=>'Description',:editable=>false},
			{:name=>:select, :header=>'Select',:editable=>false}
			]
	      
	      
	      
	      },

{ itemId: 'cls',
              :name => "cls",
              :class_name => "Netzke::Basepack::GridPanel",
              :model => "Ccl",
            	:edit=>false,      
              :title => "Classification Codes", :width=>450, :height=>250,
	      :columns => [
	            
	                {:name=>:sbtnccftcode, :header=>'Classification Code',:editable=>false},
			{:name=>:sbtnccft, :header=>'Description',:editable=>false},
			{:name=>:select, :header=>'Select',:editable=>false}]
	            
	      },
	      
	{xtype: 'button', fieldLabel: 'Submit', id:'submit', :name=>'submit'},
	{xtype: 'button', fieldLabel: 'Login', id:'login', :name=>'login'} 
	      



]   


endpoint :company_info do |params|
	
	
@sbtnuser=UsersController.new
@sbtnuser.create(params)
  








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

  
   this.companyInfo({fname:Ext.getCmp('fname').getValue(),lname:Ext.getCmp('lastname').getValue(),uname:Ext.getCmp('uname').getValue(), pword:Ext.getCmp('password').getValue(), 
   email:Ext.getCmp('email').getValue(), cname:Ext.getCmp('cname').getValue(),cweb:Ext.getCmp('cweb').getValue(),pnum:Ext.getCmp('phone').getValue(), adres:Ext.getCmp('address').getValue(), zcode:Ext.getCmp('zipcode').getValue(),
   cstate:Ext.getCmp('statesc').getValue(),numE:Ext.getCmp('nue').getValue(), yibiz:Ext.getCmp('yib').getValue(),fclear:Ext.getCmp('fc').getValue(),cexp:Ext.getCmp('cx').getValue(),
   aside:asdata, ndata:conaics,cdata:cocls});
    

    


}																	
    JS



















end









