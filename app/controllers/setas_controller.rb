class SetasController < ApplicationController
  # GET /setas
  # GET /setas.xml
  def index
    @setas = Seta.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @setas }
    end
  end

  # GET /setas/1
  # GET /setas/1.xml
  def show
    @seta = Seta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seta }
    end
  end

  # GET /setas/new
  # GET /setas/new.xml
  def new
    @seta = Seta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seta }
    end
  end

  # GET /setas/1/edit
  def edit
    @seta = Seta.find(params[:id])
  end

  # POST /setas
  # POST /setas.xml
  def create
    @seta = Seta.new(params[:seta])

    respond_to do |format|
      if @seta.save
        format.html { redirect_to(@seta, :notice => 'Seta was successfully created.') }
        format.xml  { render :xml => @seta, :status => :created, :location => @seta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /setas/1
  # PUT /setas/1.xml
  def update
    @seta = Seta.find(params[:id])

    respond_to do |format|
      if @seta.update_attributes(params[:seta])
        format.html { redirect_to(@seta, :notice => 'Seta was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /setas/1
  # DELETE /setas/1.xml
  def destroy
    @seta = Seta.find(params[:id])
    @seta.destroy

    respond_to do |format|
      format.html { redirect_to(setas_url) }
      format.xml  { head :ok }
    end
  end
end
