class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :study_texts, dependent: :destroy
  has_many :study_time, dependent: :destroy
  has_many :learning_details, dependent: :destroy
  # has_many :study_texts, dependent: :destroy
end
