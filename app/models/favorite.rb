class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :study_time, optional: true
  validates_uniqueness_of :study_time_id, scope: :user_id

end
