class Post < ApplicationRecord
  has_one :study_time
  belongs_to :user
end



