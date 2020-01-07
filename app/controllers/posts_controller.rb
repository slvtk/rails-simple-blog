class PostsController<ApplicationController

  before_action :authenticate_user!, except: [:index]

	before_action :set_post , only: [:show, :edit, :update, :destroy ] 

  def home
    @posts=current_user.posts.all
  end

  def index
    @posts=Post.all
  end

  def show
    @comments=Post.find(params[:id]).comments
  end

  def new
    @post=current_user.posts.new
  end

  def create
    @post=current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post=Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:summary,:body)
  end
end