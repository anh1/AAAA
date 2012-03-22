class NetzkeclsController < ApplicationController
  # GET /netzkecls
  # GET /netzkecls.xml
  def index
    @netzkecls = Netzkecl.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @netzkecls }
    end
  end

  # GET /netzkecls/1
  # GET /netzkecls/1.xml
  def show
    @netzkecl = Netzkecl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @netzkecl }
    end
  end

  # GET /netzkecls/new
  # GET /netzkecls/new.xml
  def new
    @netzkecl = Netzkecl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @netzkecl }
    end
  end

  # GET /netzkecls/1/edit
  def edit
    @netzkecl = Netzkecl.find(params[:id])
  end

  # POST /netzkecls
  # POST /netzkecls.xml
  def create
    @netzkecl = Netzkecl.new(params[:netzkecl])

    respond_to do |format|
      if @netzkecl.save
        format.html { redirect_to(@netzkecl, :notice => 'Netzkecl was successfully created.') }
        format.xml  { render :xml => @netzkecl, :status => :created, :location => @netzkecl }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @netzkecl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /netzkecls/1
  # PUT /netzkecls/1.xml
  def update
    @netzkecl = Netzkecl.find(params[:id])

    respond_to do |format|
      if @netzkecl.update_attributes(params[:netzkecl])
        format.html { redirect_to(@netzkecl, :notice => 'Netzkecl was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @netzkecl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /netzkecls/1
  # DELETE /netzkecls/1.xml
  def destroy
    @netzkecl = Netzkecl.find(params[:id])
    @netzkecl.destroy

    respond_to do |format|
      format.html { redirect_to(netzkecls_url) }
      format.xml  { head :ok }
    end
  end
end
