class Post < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validates :contents, presence: true
end
