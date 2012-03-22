class ObvsController < ApplicationController
  # GET /obvs
  # GET /obvs.xml
  def index
    @obvs = Obv.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obvs }
    end
  end

  # GET /obvs/1
  # GET /obvs/1.xml
  def show
    @obv = Obv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @obv }
    end
  end

  # GET /obvs/new
  # GET /obvs/new.xml
  def new
    @obv = Obv.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @obv }
    end
  end

  # GET /obvs/1/edit
  def edit
    @obv = Obv.find(params[:id])
  end

  # POST /obvs
  # POST /obvs.xml
  def create
    @obv = Obv.new(params[:obv])

    respond_to do |format|
      if @obv.save
        format.html { redirect_to(@obv, :notice => 'Obv was successfully created.') }
        format.xml  { render :xml => @obv, :status => :created, :location => @obv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @obv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /obvs/1
  # PUT /obvs/1.xml
  def update
    @obv = Obv.find(params[:id])

    respond_to do |format|
      if @obv.update_attributes(params[:obv])
        format.html { redirect_to(@obv, :notice => 'Obv was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @obv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /obvs/1
  # DELETE /obvs/1.xml
  def destroy
    @obv = Obv.find(params[:id])
    @obv.destroy

    respond_to do |format|
      format.html { redirect_to(obvs_url) }
      format.xml  { head :ok }
    end
  end
end
