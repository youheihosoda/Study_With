class StudyText < ApplicationRecord
 belongs_to :user,  optional: true
 has_many :study_time_texts
 has_many :study_times, through: :study_time_texts
 validates :name,length: { maximum: 30 }
end
