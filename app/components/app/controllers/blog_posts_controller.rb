class BlogPostsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create]
layout "blog_posts"
 
  def index
    @blog_posts = @current_user.blogs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blog_posts }
    end
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.xml
  def show
    @blog_post = @current_user.blogs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog_post }
    end
  end

  # GET /blog_posts/new
  # GET /blog_posts/new.xml
  def new
    @blog_post = @current_user.blogs.build

   end

  # GET /blog_posts/1/edit
  def edit
    @blog_post = @current_user.blogs.find(params[:id])
  end

  # POST /blog_posts
  # POST /blog_posts.xml
  def create
    @blog_post = @current_user.blogs.create!(params[:blog_post])
     if @blog_post.save
      flash[:notice] = "Message save."
      redirect_to :controller=>"blog_posts", :action => "index"
      end
    


  end

  # PUT /blog_posts/1
  # PUT /blog_posts/1.xml
  def update
    @blog_post = @current_user.blogs.find(params[:id])

    respond_to do |format|
      if @blog_post.update_attributes(params[:blog_post])
        format.html {  redirect_to :controller=>"blog_posts", :action => "index"}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.xml
  def destroy
    @blog_post = @current_user.blogs.find(params[:id])
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to(blog_posts_url) }
      format.xml  { head :ok }
    end
  end
end
