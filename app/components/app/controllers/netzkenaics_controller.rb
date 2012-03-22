class NetzkenaicsController < ApplicationController
  # GET /netzkenaics
  # GET /netzkenaics.xml
  def index
    @netzkenaics = Netzkenaic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @netzkenaics }
    end
  end

  # GET /netzkenaics/1
  # GET /netzkenaics/1.xml
  def show
    @netzkenaic = Netzkenaic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @netzkenaic }
    end
  end

  # GET /netzkenaics/new
  # GET /netzkenaics/new.xml
  def new
    @netzkenaic = Netzkenaic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @netzkenaic }
    end
  end

  # GET /netzkenaics/1/edit
  def edit
    @netzkenaic = Netzkenaic.find(params[:id])
  end

  # POST /netzkenaics
  # POST /netzkenaics.xml
  def create
    @netzkenaic = Netzkenaic.new(params[:netzkenaic])

    respond_to do |format|
      if @netzkenaic.save
        format.html { redirect_to(@netzkenaic, :notice => 'Netzkenaic was successfully created.') }
        format.xml  { render :xml => @netzkenaic, :status => :created, :location => @netzkenaic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @netzkenaic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /netzkenaics/1
  # PUT /netzkenaics/1.xml
  def update
    @netzkenaic = Netzkenaic.find(params[:id])

    respond_to do |format|
      if @netzkenaic.update_attributes(params[:netzkenaic])
        format.html { redirect_to(@netzkenaic, :notice => 'Netzkenaic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @netzkenaic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /netzkenaics/1
  # DELETE /netzkenaics/1.xml
  def destroy
    @netzkenaic = Netzkenaic.find(params[:id])
    @netzkenaic.destroy

    respond_to do |format|
      format.html { redirect_to(netzkenaics_url) }
      format.xml  { head :ok }
    end
  end
end
