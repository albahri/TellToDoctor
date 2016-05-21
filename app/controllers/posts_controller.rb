class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  # GET /ask_doctor/1/posts
  def index
    #find the ask_doctor for the id provided
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    #Get all the posts associated with this ask_doctor
    @posts = @ask_doctor.posts 
  end

  # GET /posts/1
  # GET /posts/1.json
  # GET /blogs/1/posts/2
  def show
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    # Fill an post in ask_doctors 1 that has id=2
    @post = @ask_doctor.posts.find(params[:id])
  end

  # GET /posts/new
    # GET /ask_doctors/1/posts/new
  def new
    @ask_doctor= AskDoctor.find(params[:ask_doctor_id])
    # Associate an post object with the ask_doctor
    @post = @ask_doctor.posts.build
  end

  # GET /posts/1/edit
  # GET /ask_doctors/1/posts/2/edit
  def edit
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    @post = @ask_doctor.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  # POST /ask_doctor/1/posts
   
  def create
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    @post = @ask_doctor.posts.build(post_params)
    if @post.save 
      #Post saved, redirect to ask_doctor page
       redirect_to ask_doctor_posts_path(@ask_doctor, @post)
        else
     render :action => "new"
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  # PUT /ask_doctors/1/posts/2

  def update
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
    #Post saved, redirect
    # redirect_to ask_doctor_post_url(@ask_doctor, @post)
    redirect_to ask_doctor_post_path(@ask_doctor, @post)
    else
    render :action =>"edit"
  end
  end
  # DELETE /posts/1
  # DELETE /posts/1.json
  # DELETE /ask_doctor/1/posts/2
  def destroy
    @ask_doctor = AskDoctor.find(params[:ask_doctor_id])
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
    format.html {redirect_to ask_doctor_posts_path(@ask_doctor) }
    format.xml {head :ok}
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post_message, :ask_doctor_id)
    end
  
end