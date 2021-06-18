class StudyTime < ApplicationRecord
  belongs_to :user
  has_many :study_time_texts
  belongs_to :learning_detail, optional: true
end
