class MylistsController < ApplicationController
  layout "cms"
  def index

  end

  # GET /mylists/1
  # GET /mylists/1.xml
  def show
    @mylist = Mylist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mylist }
    end
  end

  # GET /mylists/new
  # GET /mylists/new.xml
  def new
    @mylist = Mylist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mylist }
    end
  end

  # GET /mylists/1/edit
  def edit
    @mylist = Mylist.find(params[:id])
  end

  # POST /mylists
  # POST /mylists.xml
  def create
    @mylist = Mylist.new(params[:mylist])

    respond_to do |format|
      if @mylist.save
        format.html { redirect_to(@mylist, :notice => 'Mylist was successfully created.') }
        format.xml  { render :xml => @mylist, :status => :created, :location => @mylist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mylist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mylists/1
  # PUT /mylists/1.xml
  def update
    @mylist = Mylist.find(params[:id])

    respond_to do |format|
      if @mylist.update_attributes(params[:mylist])
        format.html { redirect_to(@mylist, :notice => 'Mylist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mylist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mylists/1
  # DELETE /mylists/1.xml
  def destroy
    @mylist = Mylist.find(params[:id])
    @mylist.destroy

    respond_to do |format|
      format.html { redirect_to(mylists_url) }
      format.xml  { head :ok }
    end
  end
end
