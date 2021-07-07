class Public::PostsController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @study_time = StudyTime.new
    @study_times = StudyTime.all
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_posts_path
  end

  def new
    @post = Post.new
    @study_time = StudyTime.find(params[:study_time_id])
  end

  def destroy
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :study_time_id, :study_text_id, :learning_detail_id)
  end
end
