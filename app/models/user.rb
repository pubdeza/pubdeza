class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  mount_uploader :image, ImageUploader

  # devise
  # attr_accessor :login
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :omniauthable,:validatable

  #def self.find_first_by_auth_conditions(warden_conditions)
  #  binding.pry
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:login)
  #    where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  #  else
  #    where(conditions).first
  #  end
  #end

end
