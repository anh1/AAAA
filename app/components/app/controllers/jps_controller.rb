class JpsController < ApplicationController
  # GET /jps
  # GET /jps.xml
  def index
    @jps = Jp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jps }
    end
  end

  # GET /jps/1
  # GET /jps/1.xml
  def show
    @jp = Jp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jp }
    end
  end

  # GET /jps/new
  # GET /jps/new.xml
  def new
    @jp = Jp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jp }
    end
  end

  # GET /jps/1/edit
  def edit
    @jp = Jp.find(params[:id])
  end

  # POST /jps
  # POST /jps.xml
  def create
    @jp = Jp.new(params[:jp])

    respond_to do |format|
      if @jp.save
        format.html { redirect_to(@jp, :notice => 'Jp was successfully created.') }
        format.xml  { render :xml => @jp, :status => :created, :location => @jp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jps/1
  # PUT /jps/1.xml
  def update
    @jp = Jp.find(params[:id])

    respond_to do |format|
      if @jp.update_attributes(params[:jp])
        format.html { redirect_to(@jp, :notice => 'Jp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jps/1
  # DELETE /jps/1.xml
  def destroy
    @jp = Jp.find(params[:id])
    @jp.destroy

    respond_to do |format|
      format.html { redirect_to(jps_url) }
      format.xml  { head :ok }
    end
  end
end
