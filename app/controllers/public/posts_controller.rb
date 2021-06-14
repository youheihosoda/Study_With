class Public::PostsController < ApplicationController

 def show
 end

 def index
  @user = current_user
  @study_time = StudyTime.new
 end

 def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  @post.save
  redirect_to public_posts_path
 end

 def new
  # @study_time = StudyTime.find(params[:id])
  # @study_time_count = @study_time.end_time -  @study_time.start_time
  @post = Post.new
 end

 def destroy
 end

 def update
 end


 def post_params
  params.require(:post).permit(:post_text)
 end
end
