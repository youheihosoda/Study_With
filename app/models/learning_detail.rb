class LearningDetail < ApplicationRecord
  belongs_to :user
  has_many :study_times
  validates :detail, length: { maximum: 30 }, presence: true
end
