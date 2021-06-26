class StudyTime < ApplicationRecord
  belongs_to :user
  has_many :study_time_texts
  has_many :study_texts, through: :study_time_texts
  belongs_to :learning_detail, optional: true
  has_many :photos, dependent: :destroy
  accepts_attachments_for :photo_images, attachment: :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
  end

  validates :study_method,length: { maximum: 150 }

end
