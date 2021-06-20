class StudyForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :study_method, :string
  attribute :study_time_id, :integer
  attribute :learning_detail_id, :integer
  attribute :study_text_ids
  attribute :photo_images


  # attr_accessor :study_text_ids, :study_method, :study_time_id, :learning_detail_id, :photo_ids
  validates :study_text_ids, presence: true, on: :update
  validates :study_method, presence: true, on: :update
  validates :study_time_id, presence: true, on: :update
  validates :learning_detail_id, presence: true, on: :update
  validates :photo_images, presence: true, on: :update
  # belongs_to :photo
  # accepts_attachments_for :photo_images, attachment: :image
end