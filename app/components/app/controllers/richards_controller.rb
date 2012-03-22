class RichardsController < ApplicationController
layout "cms"
  def index  
    
    
    
  end

  # GET /richards/1
  # GET /richards/1.xml
  def show
    @richard = Richard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @richard }
    end
  end

  # GET /richards/new
  # GET /richards/new.xml
  def new
    @richard = Richard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @richard }
    end
  end

  # GET /richards/1/edit
  def edit
    @richard = Richard.find(params[:id])
  end

  # POST /richards
  # POST /richards.xml
  def create
    @richard = Richard.new(params[:richard])

    respond_to do |format|
      if @richard.save
        format.html { redirect_to(@richard, :notice => 'Richard was successfully created.') }
        format.xml  { render :xml => @richard, :status => :created, :location => @richard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @richard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /richards/1
  # PUT /richards/1.xml
  def update
    @richard = Richard.find(params[:id])

    respond_to do |format|
      if @richard.update_attributes(params[:richard])
        format.html { redirect_to(@richard, :notice => 'Richard was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @richard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /richards/1
  # DELETE /richards/1.xml
  def destroy
    @richard = Richard.find(params[:id])
    @richard.destroy

    respond_to do |format|
      format.html { redirect_to(richards_url) }
      format.xml  { head :ok }
    end
  end
end
