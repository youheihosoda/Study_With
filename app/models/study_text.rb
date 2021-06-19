class StudyText < ApplicationRecord
 belongs_to :user
 has_many :study_time_texts
 has_many :study_times, through: :study_time_texts
end
