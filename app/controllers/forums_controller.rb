class ForumsController < ApplicationController
 
 
 
 def index  
@forums = Forum.find(:all)


end

 def new      
      @forum=Forum.new      
    end 
   
   def create
    @forum = Forum.new(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to(@forum, :notice => 'Home was successfully created.') }
        format.xml  { render :xml => @forum, :status => :created, :location => @forum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
      end
    end
  end







def show
  

@results=Topic.find(:first)
@forum=Forum.find(params[:id])
#@forum=Forum.search params[:search]

#@forum = Forum.search :conditions => { :id => params[:id] }
      
end

def fsearch

if request.xml_http_request?	
@results = Forum.results(params[:search])

 render :update do |page| 
  page.replace_html "search_table",  :partial => "topics_search", :layout => false

end
end

#@results = Topic.find(params[:search])
#render :partial => "topics_search", :layout => false


end

end