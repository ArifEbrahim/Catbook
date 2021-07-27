class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validates :firstname, presence: true
  validates :lastname, presence: true

  def avatar_thumbnail
    avatar.variant(resize: "75x75!").processed
  end

  def avatar_profile
    avatar.variant(resize: "350x525!").processed
  end
  has_many :posts
end
