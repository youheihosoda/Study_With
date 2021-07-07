class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :study_time, optional: true
  validates :comment, length: { maximum: 150 }
end
