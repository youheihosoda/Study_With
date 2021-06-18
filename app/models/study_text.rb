class StudyText < ApplicationRecord
 belongs_to :user
 has_many :study_time_texts
end
