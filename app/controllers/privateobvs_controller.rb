class PrivateobvsController < ApplicationController
  # GET /privateobvs
  # GET /privateobvs.xml
  def index
    @privateobvs = Privateobv.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @privateobvs }
    end
  end

  # GET /privateobvs/1
  # GET /privateobvs/1.xml
  def show
    @privateobv = Privateobv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @privateobv }
    end
  end

  # GET /privateobvs/new
  # GET /privateobvs/new.xml
  def new
    @privateobv = Privateobv.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @privateobv }
    end
  end

  # GET /privateobvs/1/edit
  def edit
    @privateobv = Privateobv.find(params[:id])
  end

  # POST /privateobvs
  # POST /privateobvs.xml
  def create
    @privateobv = Privateobv.new(params[:privateobv])

    respond_to do |format|
      if @privateobv.save
        format.html { redirect_to(@privateobv, :notice => 'Privateobv was successfully created.') }
        format.xml  { render :xml => @privateobv, :status => :created, :location => @privateobv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @privateobv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /privateobvs/1
  # PUT /privateobvs/1.xml
  def update
    @privateobv = Privateobv.find(params[:id])

    respond_to do |format|
      if @privateobv.update_attributes(params[:privateobv])
        format.html { redirect_to(@privateobv, :notice => 'Privateobv was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @privateobv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /privateobvs/1
  # DELETE /privateobvs/1.xml
  def destroy
    @privateobv = Privateobv.find(params[:id])
    @privateobv.destroy

    respond_to do |format|
      format.html { redirect_to(privateobvs_url) }
      format.xml  { head :ok }
    end
  end
end
