class PrivatejpsController < ApplicationController
  # GET /privatejps
  # GET /privatejps.xml
  def index
    @privatejps = Privatejp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @privatejps }
    end
  end

  # GET /privatejps/1
  # GET /privatejps/1.xml
  def show
    @privatejp = Privatejp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @privatejp }
    end
  end

  # GET /privatejps/new
  # GET /privatejps/new.xml
  def new
    @privatejp = Privatejp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @privatejp }
    end
  end

  # GET /privatejps/1/edit
  def edit
    @privatejp = Privatejp.find(params[:id])
  end

  # POST /privatejps
  # POST /privatejps.xml
  def create
    @privatejp = Privatejp.new(params[:privatejp])

    respond_to do |format|
      if @privatejp.save
        format.html { redirect_to(@privatejp, :notice => 'Privatejp was successfully created.') }
        format.xml  { render :xml => @privatejp, :status => :created, :location => @privatejp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @privatejp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /privatejps/1
  # PUT /privatejps/1.xml
  def update
    @privatejp = Privatejp.find(params[:id])

    respond_to do |format|
      if @privatejp.update_attributes(params[:privatejp])
        format.html { redirect_to(@privatejp, :notice => 'Privatejp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @privatejp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /privatejps/1
  # DELETE /privatejps/1.xml
  def destroy
    @privatejp = Privatejp.find(params[:id])
    @privatejp.destroy

    respond_to do |format|
      format.html { redirect_to(privatejps_url) }
      format.xml  { head :ok }
    end
  end
end
