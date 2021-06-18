class StudyForm
  include ActiveModel::Model
  attr_accessor :study_text_ids, :study_method, :study_time_id, :learning_detail_id
   validates :study_text_ids, presence: true, on: :update
   validates :study_method, presence: true, on: :update
   validates :study_time_id, presence: true, on: :update
   validates :learning_detail_id, presence: true, on: :update
end