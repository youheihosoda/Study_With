class Photo < ApplicationRecord
  belongs_to :study_time
  attachment :image
end
