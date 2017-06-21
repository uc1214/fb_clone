class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :topic_img, presence: true

  mount_uploader :topic_img, ImgUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
end
