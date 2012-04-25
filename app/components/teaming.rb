# Common things for all 4 grids in contract panel: actions, etc.
require File.dirname(__FILE__) + "/teaming_grid"

class Teaming < Netzke::Base
=begin
  js_base_class "Ext.Viewport"
 

  component :fedbizs
  component :jps
  component :obvs
  component :mylists
  component :tcs # AKA Tcom
  component :youtube_player
  component :hello_world_component

  # Configuration of teaming page layout. This center panel contains the
  # records for fedbiz,teaming,and mylist grid. The east panel will
  # contain the companies that are interested in the selected record.
  # The south panel has a tool bar. The layoout is a card layout that
  # allows the user to cycle through the fedbiz, teaming, and mylist
  # grid with the "<<".
  def configuration

    current_user = User.find(session[:user_id]) 
    
    super.merge(  

                :header => true, :footer => true, :height => 540,   :layout => :border,
                
                :items =>  [
                            {  
                              :items => [{:name => "info",:class_name => "Basepack::Panel", :title=> "Info" }],              
                              :region => :center, 
                              :autoScroll:true,
                              :width => 150
                            },      
                            
                            {
                              :region => :south,
                              :id => 'southPanel',
                              :layout => 'card',
                              :deferredRender => false,
                              :layoutOnCardChange => true,
                              :height => 300,
                              :activeItem => 0,

                              :tbar => [:post.action,
                                        :reply.action,"-",
                                        :save.action,
                                        :delete.action, "-",
                                        :update.action,
                                        :message.action,
                                        "-",
                                        { #:text => ">>>", 
                                          :ref => "../prevButton",:handler=> :on_switch_grid, :icon => uri_to_icon(:forward_green),  :iconAlign => "right"},

                                        {:html => "FedBizOpp",:id => 'conchoice', :width => 50, :iconAlign => "center"}
                                       ],    
                              
                              
                              :items => %w{ fedbizs jps obvs mylists}.map(&:to_sym).map(&:component)
                            },
                                         
                            :region => 'east',  
                            :layout => 'fit',
                            :id => 'eastPanel',
                            :width => 650,
                            :split => true,      
                            :border => true,
                            :title => "Company",
                            :collapsible => true, 
                            :items => [:tcs.component(:header => false, :load_inline_data => false)]
                           ]
                )
      # ----------------------------------------
  end # end of configuration
	 
  

  
      
  #action :show_details, :text => "Show details"      
  action :save, :text => 'Save', :icon => :accept
  action :reply, :text => 'Reply',:disabled => true
  action :post, :text => 'Post', :icon => :accept
  action :add, :text => 'add'
  action :filter, :text => 'filter'
  action :delete, :text => 'Delete', :disabled => true, :icon => :delete
  action :message, :text => 'Message'
  action :forward, :text => 'Forward'
  action :show_details, :text => "Show details"
  action :update, :text => "Update",:disabled => true 
  
  
  # Defines the netzke components that loads all the companies that are
  # interested in the selected fedbiz and teaming contract
  component :iedcomsLoad do {
      :class_name => "Basepack::GridPanel",
      :model => "Tcom",	
      :header => false, 
      :columns => [	 
                   #{:name => :id, :header => 'Teaming#', :hidden => false, :width=> 45},
                   {:name => :coname, :header => 'Company'},
                   {:name => :coweb, :header => 'Website'},	
                   {:name => :conaics, :header => 'Naics Code'},
                   {:name => :cocft, :header => 'Classification Code'},					
                   {:name => :select, :header => 'Select'},
                   {:name => :created_at, :hidden => true},
                   {:name => :updated_at, :header => 'Date'}
                  ],
      
      
      
      :view_config => {:force_fit => true },
      # do not load data initially
      :load_inline_data => false,	
      # limit the scope to the selected boss (see below)
      #:scope => {:fedbiz_id => component_session[:selected_fedbiz_id]},	
      :scope => {:id => component_session[:selected_iedcoms_ids]}
      # :strong_defaults_attrs => {:fedbiz_id => component_session[:selected_fedbiz_id]},
    }
 end 
   
  # When a user selects a fedbiz contract, the info and interested
  # companies are loaded with the select_fedbiz. Also when the
  # interest check button is checked for a fedbiz contract,
  # select_fedbiz function is called by Checkcolumn file (see) and
  # adds the user id to the iedcoms which contains the id's of all the
  # interested companies to be load in the east panel
  endpoint :select_fedbiz do |params|
    # store selected fedbiz id in the session for this component's instance
    cin=User.find_by_id(session[:user_id])
    
    iconame=cin.coname

    cin_id=Tcom.where(:coname => iconame)[0].id
    
    # cin_id=cin.id
    fedbiz = Fedbiz.find_by_id(params[:fedbiz_id].to_i)
    icoms = eval(fedbiz.iedcoms)
    display=true
    
    if params[:i_status] == "true" && icoms.uniq!.nil? then
      axarray=eval(fedbiz.iedcoms)
      axarray << cin_id
      icoms=axarray
      fedbiz.iedcoms=axarray.to_s 
      fedbiz.save
      if params[:match]=="nomatch" then display=false end
    end  # selected fedbiz
    
    if params[:i_status]=="false" then 
      icoms.delete(cin_id)
      fedbiz.iedcoms=icoms.to_s
      fedbiz.save
      if params[:match]=="nomatch" then display=false end
    end	
    
    if display==true then
      component_session[:selected_iedcoms_ids] = icoms 
      tcs_grid = component_instance(:iedcomsLoad)
      tcs_data = tcs_grid.get_data
      { :tcs =>{:load_store_data => tcs_data},
        :info => {:update_body_html => fedbiz_info_html(fedbiz) }   
        
      }
    end
    
  end # endpoint select_fedbiz



  # It defines the information that should be load in the info when a
  # fedbiz_contract is selected.
  def fedbiz_info_html(fedbiz)
    res = "<h1>FedBizOpp Summary</h1>"
    res << "Sol#: #{fedbiz.sol_num}<br/>"
    res << "Sol Opp.: #{fedbiz.sol_opp}<br/>"
    res << "Date: #{fedbiz.sol_date}<br/>"
    res << "State: #{fedbiz.sol_state}<br/>"  
    res << "Type: #{fedbiz.sol_type}<br/>" 
    res << "NAICS Code: #{fedbiz.sol_naics}<br/>" 
    res << "Classification Code: #{fedbiz.sol_class}<br/>" 
    res << "Set Aside: #{fedbiz.sol_aside}<br/>" 
    res << "Agency/Office/Location: #{fedbiz.sol_agency}/#{fedbiz.sol_office}/#{fedbiz.sol_location}<br/>" 
    res << "Response Date: #{fedbiz.sol_rdate}<br/>" 
    res << "Solictation Info: #{fedbiz.sol_link}<br/>"   
    res
  end


  endpoint :select_tables do |params|

    # store selected fedbiz id in the session for this component's instance
    cin = User.find_by_id(session[:user_id])
    
    iconame = cin.coname
    
    cin_id=Tcom.where(:coname => iconame)[0].id
    
    #cin_id=cin.id
    
    if (params[:grid_type]=="Obv")  then  jp = Obv.find_by_id(params[:jp_id]) end
    
    if (params[:grid_type]=="Privateobv")  then  jp = Privateobv.find_by_id(params[:jp_id]) end
    
    if (params[:grid_type]=="Privatejp") then jp = Privatejp.find_by_id(params[:jp_id]) end
    
    if (params[:grid_type]=="Jp") then jp= Jp.find_by_id(params[:jp_id]) end 

    
    
    icoms = eval(jp.iedcoms) # Dangerous!
    display=true
    visible_to_public=true
    
    if params[:i_status]=="true" && icoms.uniq!.nil? then
      axarray = eval(jp.iedcoms)
      axarray << cin_id
      icoms = axarray
      jp.iedcoms = axarray.to_s 
      jp.save
      if params[:match] == "nomatch" then display = false end
    end  # selected fedbiz

    if params[:i_status]=="false" then icoms.delete(cin_id)
      icoms.delete(cin_id)
      jp.iedcoms=icoms.to_s
      jp.save
      if params[:match]=="nomatch" then display=false end
    end
    


    if (jp.vtp=="1" || jp.vtp=="3") then icoms=[] end
    
    if ((jp.vtp=="1" || jp.vtp=="3") && jp.vtpu==cin.id) then
      icoms=eval(jp.iedcoms) # DANGEROUS - eval
    end


    if (display) then
      component_session[:selected_iedcoms_ids] = icoms 
      tcs_grid = component_instance(:iedcomsLoad)
      tcs_data = tcs_grid.get_data
      { :tcs =>{:load_store_data => tcs_data},
        :info => {:update_body_html => jp_info_html(jp) }   
      }
    end
  end
  


  # It defines the information that should be load in the info panel
  # for a jp or jp_private request is selected.
  def jp_info_html(jp)
  res = "<h1>Teaming Summary</h1>"
  res << "Initiator: #{jp.jpco}<br/>"
  res << "Title: #{jp.jptitle}<br/>"
  res << "Date: #{jp.updated_at}<br/>"
  res << "Location: #{jp.jploc}<br/>"  
  res << "Type: #{jp.jpctype}<br/>" 
  res << "NAICS Code: #{jp.jpnaics}<br/>" 
  res << "Classification Code: #{jp.jpclass}<br/>" 
  res << "Teaming Info: #{jp.jptext}<br/>"   
  res
end



#it defines the information that should be load in the info panel for a jp or jp_private  request is selected.
def obv_info_html(jp)
  res = "<h1>Teaming Summary</h1>"
  res << "Initiator: #{jp.jpco}<br/>"
  res << "Title: #{jp.jptitle}<br/>"
  res << "Date: #{jp.updated_at}<br/>"
  res << "Location: #{jp.jploc}<br/>"  
  res << "Type: #{jp.jpctype}<br/>" 
  res << "NAICS Code: #{jp.jpnaics}<br/>" 
  res << "Classification Code: #{jp.jpclass}<br/>" 
  res << "Teaming Info: #{jp.jptext}<br/>"   
  res
end






  #it loads a reply to a jp, private_jp, or fedbiz contract
  endpoint :select_re do |params|
    cin=User.find_by_id(session[:user_id])
    
    reply=Mylist.where(:id=>params[:reply_id])[0]
    replyinitiator=Tcom.where(:id=>reply.vtpu)[0].coname
    
    reply.vtpu=replyinitiator
    reply.save
    
    # tcs_data = tcs_grid.get_data
    { #:tcs =>{:load_store_data => tcs_data},
      :info => {:update_body_html => reply_info_html(reply) }   
    }
  end




  #load a reply info into the center panel
  def reply_info_html(reply)
    res = "<h1>Teaming Summary</h1>"
    res << "Initiator: #{reply.vtpu}<br/>"
    res << "Subject: #{reply.retitle}<br/>"
    res << "Date: #{reply.updated_at}<br/>"
    res << "Teaming Info: #{reply.retext}<br/>"   
    res
	
  end


  #Add to mylist grid when the interest checkbox is checked in the current fedbiz or jp grid
  endpoint :add_to_mylist do |params|
	
    @cinid_to_mylist=User.find_by_id(session[:user_id]).id
    checkfor_record_fedbiz=Mylist.where(:grid_type=>params[:grid_type], :record_id=>params[:fedbiz_id])
    #checkfor_record_jp=Mylist.where(:grid_type=>params[:grid_type], :record_id=>params[:jp_id])
    savejp=false
      if (checkfor_record_fedbiz.empty? && params[:grid_type]=="Fedbiz") then
      fedbiz_record=Fedbiz.where(:id => params[:fedbiz_id])[0] end
      
      @save_fedbizRecord_tomylist = Mylist.create(
                                                  :sbtnid => fedbiz_record.sbtnid,
                                                  :ctractitle => fedbiz_record.sol_opp,
                                                  :ctractdate => fedbiz_record.sol_date,
                                                  :ctractstate => fedbiz_record.sol_state,
                                                  :ctractnotice => fedbiz_record.sol_type,
                                                  :ctractnaics => fedbiz_record.sol_naics,
                                                  :ctractclass => fedbiz_record.sol_class,
                                                  :ctractype => 'Fedbiz',
                                                  :iedcoms => fedbiz_record.iedcoms,
                                                  :interest => true,
                                                  :grid_type => 'Fedbiz',
                                                  :record_id => params[:fedbiz_id],
                                                  :vtp => "none", 
                                                  :vtpu => "none", 
                                                  :user_id => @cinid_to_mylist
                                                  )
      @save_fedbizRecord_tomylist.save

      
    if (params[:grid_type]=="Obv") then
      grid_type="Obv"
      record=Obv.where(:id => params[:jp_id])[0] 
      savejp=true
    end
   
    if (params[:grid_type]=="Jp") then
      grid_type="Jp"
      record=Jp.where(:id => params[:jp_id])[0]
      savejp=true
    end

    if (params[:grid_type]=="Privateobv") then
      grid_type="Privateobv"
      record=Privateobv.where(:id => params[:jp_id])[0] 
      savejp=true
    end
   
    if (params[:grid_type]=="Privatejp") then
      grid_type="Privatejp"
      record=Privatejp.where(:id => params[:jp_id])[0]
      savejp=true
    end
    
        if (savejp==true) then	
      @save_tomylist = Mylist.create(
                                     :sbtnid => record.sbtnid,
                                     :ctractitle => record.jptitle,
                                     :ctractdate => record.updated_at,
                                     :ctractstate => record.jploc,
                                     :ctractype => record.jpctype,
                                     :ctractnaics => record.jpnaics,
                                     :ctractclass => record.jpclass,:interest => true,
                                     :iedcoms => record.iedcoms,
                                     :grid_type => grid_type,
				     :record_id => params[:jp_id],
                                     :vtp => record.vtp,
                                     :vtpu => record.vtpu,
                                     :user_id => @cinid_to_mylist 
                                     )
      @save_tomylist.save
    end
    
    
    
    

    
  end

  # When the current grid fedbiz/jp interest checkbox box is changed
  # to false; this fedbiz/jp record is deleted from the user's mylist
  endpoint :delete_from_iedmylist do |params|
    delete_record=Mylist.where(:grid_type=>params[:grid_type], :record_id=>params[:record_id])[0]
    Mylist.delete(delete_record.id)
  end
  

  # When the current mylist grid changes the interest status to false,
  # this function updates it
  endpoint :noti_from_mylist do |params|
    noti_record=Mylist.where(:id=>params[:id])[0]
    noti_record.interest=false
    noti_record.save
  end

  # When the current mylist grid changes the interest status to true,
  # this function updates it
  endpoint :interest_from_mylist do |params|
    i_record=Mylist.where(:id=>params[:id])[0]
    i_record.interest=true
    i_record.save
  end


  # Saving multiple records from the current fedbiz or jp/privatejp
  # grid to mylist
  endpoint :saved_record_to_mylist do |params|
    @savecinid=User.find_by_id(session[:user_id]).id
    
    saveList=params[:saveList].split(',');
    
    saveList.each do |save|	
      if (params[:grid_type]=="Fedbiz") then 
	fedbiz_record=Fedbiz.where(:id => save)[0] 
        @fsavedrecord=Mylist.create(
                                    :sbtnid => fedbiz_record.sbtnid, 
                                    :ctractitle => fedbiz_record.sol_opp, 
                                    :ctractdate => fedbiz_record.sol_date, 
                                    :ctractstate => fedbiz_record.sol_state,
                                    
                                    :ctractnotice => fedbiz_record.sol_type, 
                                    :ctractnaics => fedbiz_record.sol_naics, 
                                    :ctractclass => fedbiz_record.sol_class,
                                    :ctractype => 'Fedbiz',
                                    
                                    :iedcoms => fedbiz_record.iedcoms, 
                                    :interest => false,
                                    :grid_type => 'Fedbiz',  
                                    :record_id => save,
                                    :vtp => "none", 
                                    :vtpu => "none", 
                                    :user_id => @savecinid 
                                    )
	@fsavedrecord.save
      end
      
      if (params[:grid_type]=="Jp" || params[:grid_type]=="Obv")
        jp_record=Jp.where(:id => save)[0]; 
        @jpsavedrecord=Mylist.create(
                                     :sbtnid => jp_record.sbtnid,
                                     :ctractitle => jp_record.jptitle, 
                                     :ctractdate => jp_record.updated_at, 
                                     :ctractstate => jp_record.jploc,
                                     
                                     :ctractype => jp_record.jpctype, 
                                     :ctractnaics => jp_record.jpnaics, 
                                     :ctractclass => jp_record.jpclass,
                                     :interest => false, 
                                     :iedcoms => jp_record.iedcoms,
                                     
                                     :grid_type => "Jp",
                                     :record_id => save,
                                     :vtp => jp_record.vtp, 
                                     :vtpu => jp_record.vtpu, 
                                     :user_id => @savecinid
                                     )   
        @jpsavedrecord.save  
      end	   
    end
    
  end # endpoint saved_record_to_mylist

  # Delete multiple records from the mylist grids
  endpoint :deleted_from_mylist do |params|
    
    deletecin=User.find_by_id(session[:user_id])
    deletecin_id=deletecin.id


    deletedList=params[:deleteList].split(',')


    deletedList.each do |delete|
      
      @grid_type =Mylist.where(:id=>delete)[0].grid_type	         
      @record_id=Mylist.where(:id=>delete)[0].record_id
      @vtp=Mylist.where(:id=>delete)[0].vtp
      
      if (@grid_type=="Fedbiz")  then  record_delete = Fedbiz.find_by_id(@record_id) end
      
      if (@grid_type=="Obv")  then  record_delete = Obv.find_by_id(@record_id) end
      
      if (@grid_type=="Privateobv")  then  record_delete = Privateobv.find_by_id(@record_id) end
      
      if (@grid_type=="Privatejp") then record_delete = Privatejp.find_by_id(@record_id) end
      
      if (@grid_type=="Jp") then record_delete= Jp.find_by_id(@record_id) end

      if (@vtp!="5") then      
        icoms = eval(record_delete.iedcoms)      
	icoms.delete(deletecin_id)
	record_delete.iedcoms=icoms.to_s
	record_delete.save
	Mylist.delete_all(:id=>delete)
      else
	Mylist.delete_all(:id=>delete)
      end	
    end	
  end # endpoint deleted_from_mylist

  # Add the submitted post in the correct tables(fedbiz, jp,
  # privatejp, user personal table)
  endpoint :post_form do |params|

    @cin_post=User.find_by_id(session[:user_id])

    pvpost=params[:pvpost].to_i

    if (params[:conf]=="true") then
      coname="Confidential"
    else
      coname=@cin_post.coname
    end
    
    
    if (pvpost==2 || pvpost==3) then
      if (params[:ctable]=="Teaming") then
        grid_type="Obv"
        Form_Post="Obv".classify.constantize
      else
        grid_type="Jp"
        Form_Post="Jp".classify.constantize
      end
    else
      if (params[:ctable]=="Teaming") then
        grid_type="Privateobv"
        Form_Post="Privateobv".classify.constantize
      else
        grid_type="Privatejp"
        Form_Post="Privatejp".classify.constantize
      end
    end
    
    

    if(grid_type=="Privatejp" || grid_type=="Jp") then
      @postit=Form_Post.new(
                            :sbtnid => params[:sbtnid], 
                            :jpco => coname, 
                            :jptitle => params[:ptitle],
                            :jploc => params[:ploc],
                            :jpctype => params[:ptype], 
                            :grid_type => grid_type, 
                            :jpclass => params[:pcls],
                            :jpnaics => params[:pnas],
                            :jptext => params[:pbody], 
                            :iedcoms => "[]", 
                            :vtp => pvpost, 
                            :vtpu => @cin_post.id
                            )
      @postit.save
    end


    if(grid_type=="Privateobv" || grid_type=="Obv") then  
      @postit=Form_Post.new(
                            :sbtnid => params[:sbtnid], 
                            :jpco => coname, 
                            :jptitle => params[:ptitle],
                            :jploc => "N/A",
                            :jpctype => "N/A", 
                            :grid_type => grid_type, 
                            :jpclass => "N/A",
                            :jpnaics => "N/A",
                            :jptext => params[:pbody], 
                            :iedcoms => "[]", 
                            :vtp => pvpost, 
                            :vtpu => @cin_post.id
                            )
      @postit.save
    end



    mycotable = @cin_post.id

    sendTo=[]

    sendTo << mycotable

    stoco=params[:pco].split(',')


    stoco.each do |recipient|
      recipient = User.where(:coname => recipient)[0]
      sendTo << recipient.id
    end



    
  end # endpoint post_form

  # Add the reply to the initiator and recipients personal tables
  endpoint :reply_to_post do |params|

    @cin_re=User.find_by_id(session[:user_id])


    if !Jp.where(:sbtnid=>params[:sbtnid])[0].nil? then @reply_record=Jp.where(:sbtnid=>params[:sbtnid])[0] end

    if !Privatejp.where(:sbtnid=>params[:sbtnid])[0].nil? then @reply_record=Privatejp.where(:sbtnid=>params[:sbtnid])[0] end

    if !Obv.where(:sbtnid=>params[:sbtnid])[0].nil? then @reply_record=Obv.where(:sbtnid=>params[:sbtnid])[0] end

    if !Privateobv.where(:sbtnid=>params[:sbtnid])[0].nil? then @reply_record=Privateobv.where(:sbtnid=>params[:sbtnid])[0] end

    mycotable = @cin_re.id

    sendTo=[]

    sendTo << mycotable

    stoco=params[:pco].split(',')


    stoco.each do |recipient|
      recipient = User.where(:coname=>recipient)[0]
      sendTo << recipient.id
    end


    sendTo.each do |comylist|
      
      @re_to_mylist=Mylist.create(
                                  :sbtnid=>params[:sbtnid],
                                  :ctractitle=>"RE:", 
                                  :ctractdate=>"...",
                                  
                                  :ctractstate=>"...",
                                  :ctractype=>"...", 
                                  :ctractnaics=>"...", 
                                  :ctractclass=>"...", 
                                  :iedcoms=>"...", 
                                  
                                  :grid_type=>"NULL",
                                  :record_id=>"...", 
                                  :vtp=>"5", 
                                  :vtpu=>@cin_re.id, 
                                  :user_id=>comylist,
                                  :retext=>params[:rebody],
                                  :retitle=>params[:resubject]
                                  )
      @re_to_mylist.save
      
    end
  end # endpoint reply_to_post
  
 
  # Send message to company inbox
  endpoint :send_message do |params|	
    
    stoco=params[:to].split(',');
    
    sendTo=[]
    
    stoco.each do |recipient|
      recipient = User.where(:coname => recipient)
      sendTo << recipient[0].login
    end
    
    message = {  
      :to => sendTo,
      :subject => params[:subject],
      :body => params[:body]
    }
    
    @current_user=User.find_by_id(session[:user_id])
    @message = @current_user.sent_messages.build(message)
    @message.save
  end



  # It initiatize global variables and the post(formpanel),
  # reply(reformpanel), message(meformpanel) form


js_mixin :init


# def actions
#   super.merge({
#     :show_details => {:text => "Show details", :disabled => true}
#   })
# end



js_mixin :on_fedbiz_selection_changed # function is called when a fedbiz record is selected
     
js_method :on_table_selection_changed, <<-JS
function(self, rowIndex) {
 
   this.selectTables({jp_id:self.store.getAt(rowIndex).get('id'),grid_type:self.store.getAt(rowIndex).get('grid_type')}); 
   gride= self.store.getAt(rowIndex).get('sbtnid');
   gridIndex=rowIndex;
   }
   
JS


    js_method :on_mylist_selection_changed, <<-JS
function(self, rowIndex) {

var selectedgrid=self.store.getAt(rowIndex).get('grid_type');
var vtp=self.store.getAt(rowIndex).get('vtp');
 var idgrid=self.store.getAt(rowIndex).get('record_id');
 
 if(selectedgrid=="Fedbiz") this.selectFedbiz({fedbiz_id:idgrid}); 
 if((selectedgrid !="Fedbiz") && (selectedgrid !="Null") && (vtp !="5")) this.selectTables({jp_id:idgrid,grid_type:selectedgrid}); 
 if(vtp=="5") this.selectRe({reply_id:self.store.getAt(rowIndex).get('id')});
 
gridIndex=rowIndex;
gride= self.store.getAt(rowIndex).get('sbtnid');
}   
   
JS

      

      js_method :on_show_details, <<-JS
  function(){
    var tmpl = new Ext.Template("<b>{0}</b>: {1}<br/>"), html = "";

    Ext.iterate(this.getSelectionModel().getSelected().data, function(key, value){
      html += tmpl.apply([key.humanize(), value]);
    }, this);

    Ext.Msg.show({
      title: "Details",
      width: 300,
      msg: html
    });
  }
JS
     
  js_mixin :on_reply
  js_method :on_update, <<-JS    
function(){
 this.getNetzkeComponent('helloWorldComponent').show();
}
JS
  
  js_mixin :on_message
  js_mixin :on_post
  js_mixin :on_switch_grid  
 
      # Method in the JS class that (by default) processes the action's "click" event
      js_method :on_save, <<-JS
function() {
var saveList=deletedsaveList.join(",");
var savefromgrid= Ext.getCmp('southPanel').getLayout().activeItem.id;
if (savefromgrid=="teaming__fedbizs") savegrid="Fedbiz";
if (savefromgrid=="teaming__jps") savegrid="Jp";
if (savefromgrid=="teaming__obvs") savegrid="Obv";
this.savedRecordToMylist({saveList:saveList,grid_type:savegrid});

deletedsaveList=[];



}
     JS

 js_method :on_delete, <<-JS
function() {

var deleteList=deletedsaveList.join(",");
this.deletedFromMylist({deleteList:deleteList});
deletedsaveList=[];
}
     JS
=end
end

