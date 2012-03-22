class NaicsController < ApplicationController
  # GET /naics
  # GET /naics.xml
  def index
    @naics = Naic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @naics }
    end
  end

  # GET /naics/1
  # GET /naics/1.xml
  def show
    @naic = Naic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @naic }
    end
  end

  # GET /naics/new
  # GET /naics/new.xml
  def new
    @naic = Naic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @naic }
    end
  end

  # GET /naics/1/edit
  def edit
    @naic = Naic.find(params[:id])
  end

  # POST /naics
  # POST /naics.xml
  def create
    @naic = Naic.new(params[:naic])

    respond_to do |format|
      if @naic.save
        format.html { redirect_to(@naic, :notice => 'Naic was successfully created.') }
        format.xml  { render :xml => @naic, :status => :created, :location => @naic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @naic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /naics/1
  # PUT /naics/1.xml
  def update
    @naic = Naic.find(params[:id])

    respond_to do |format|
      if @naic.update_attributes(params[:naic])
        format.html { redirect_to(@naic, :notice => 'Naic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @naic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /naics/1
  # DELETE /naics/1.xml
  def destroy
    @naic = Naic.find(params[:id])
    @naic.destroy

    respond_to do |format|
      format.html { redirect_to(naics_url) }
      format.xml  { head :ok }
    end
  end
end
