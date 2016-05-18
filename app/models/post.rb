class Post < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  mount_uploader :image, ImageUploader
  # validates :user_id, presence: true
  validates :title, presence: true
  validates :contents, presence: true
end
