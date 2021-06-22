class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :study_time, optional: true
end
