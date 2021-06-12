class Public::StudyTimesController < ApplicationController

 def create
  @start_time = StartTime.new
  @start_time.start_time = Time.now
  @start_time.user_id = current_user.id
  @start_time.save
  redirect_to public_users_path
 end

end
