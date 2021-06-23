class Public::StudyTimeTextsController < ApplicationController

  def index
    # @all_ranks = StudyTimeText.find(Like.group(:study_text_id).order('count(study_text_id) desc').limit(3).pluck(:study_text_id))
    # @rank = Like.group(:study_time_text_study_text_id).joins(:study_text).order("count(study_time_text.study_text_id) desc").limit(3)
  end
end
