class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  # before_action :process_images, only: [:create, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      params[:image].each do |image|
        @post.images.create(image: image, post_id: @post.id)
      end
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.permit(:title, :body, :video, :user_id, images_attributes: [:id, :image])
  end

  def set_post
    @post = Post.find(params[:id])
  end
  

end
