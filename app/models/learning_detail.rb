class LearningDetail < ApplicationRecord
  belongs_to :user
  has_many :study_time
  validates :detail,length: { maximum: 30 }
end
