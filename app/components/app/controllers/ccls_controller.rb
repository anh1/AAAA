class CclsController < ApplicationController
  # GET /ccls
  # GET /ccls.xml
  def index
    @ccls = Ccl.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccls }
    end
  end

  # GET /ccls/1
  # GET /ccls/1.xml
  def show
    @ccl = Ccl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccl }
    end
  end

  # GET /ccls/new
  # GET /ccls/new.xml
  def new
    @ccl = Ccl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccl }
    end
  end

  # GET /ccls/1/edit
  def edit
    @ccl = Ccl.find(params[:id])
  end

  # POST /ccls
  # POST /ccls.xml
  def create
    @ccl = Ccl.new(params[:ccl])

    respond_to do |format|
      if @ccl.save
        format.html { redirect_to(@ccl, :notice => 'Ccl was successfully created.') }
        format.xml  { render :xml => @ccl, :status => :created, :location => @ccl }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccls/1
  # PUT /ccls/1.xml
  def update
    @ccl = Ccl.find(params[:id])

    respond_to do |format|
      if @ccl.update_attributes(params[:ccl])
        format.html { redirect_to(@ccl, :notice => 'Ccl was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccls/1
  # DELETE /ccls/1.xml
  def destroy
    @ccl = Ccl.find(params[:id])
    @ccl.destroy

    respond_to do |format|
      format.html { redirect_to(ccls_url) }
      format.xml  { head :ok }
    end
  end
end
