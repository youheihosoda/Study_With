class StudyTime < ApplicationRecord
  belongs_to :user
  has_many :study_time_texts
  has_many :study_texts, through: :study_time_texts
  belongs_to :learning_detail, optional: true
  has_many :photos, dependent: :destroy
  accepts_attachments_for :photo_images, attachment: :image
end
