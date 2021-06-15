class Post < ApplicationRecord
  belongs_to :study_time, dependent: :destroy
  belongs_to :user
end



