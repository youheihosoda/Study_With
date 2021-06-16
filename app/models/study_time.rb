class StudyTime < ApplicationRecord
  has_one :post
  belongs_to :user
end
