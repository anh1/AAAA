class TcomsController < ApplicationController
  # GET /tcoms
  # GET /tcoms.xml
  def index
    @tcoms = Tcom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tcoms }
    end
  end

  # GET /tcoms/1
  # GET /tcoms/1.xml
  def show
    @tcom = Tcom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tcom }
    end
  end

  # GET /tcoms/new
  # GET /tcoms/new.xml
  def new
    @tcom = Tcom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tcom }
    end
  end

  # GET /tcoms/1/edit
  def edit
    @tcom = Tcom.find(params[:id])
  end

  # POST /tcoms
  # POST /tcoms.xml
  def create
    @tcom = Tcom.new(params[:tcom])

    respond_to do |format|
      if @tcom.save
        format.html { redirect_to(@tcom, :notice => 'Tcom was successfully created.') }
        format.xml  { render :xml => @tcom, :status => :created, :location => @tcom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tcom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tcoms/1
  # PUT /tcoms/1.xml
  def update
    @tcom = Tcom.find(params[:id])

    respond_to do |format|
      if @tcom.update_attributes(params[:tcom])
        format.html { redirect_to(@tcom, :notice => 'Tcom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tcom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tcoms/1
  # DELETE /tcoms/1.xml
  def destroy
    @tcom = Tcom.find(params[:id])
    @tcom.destroy

    respond_to do |format|
      format.html { redirect_to(tcoms_url) }
      format.xml  { head :ok }
    end
  end
end
