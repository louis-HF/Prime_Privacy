class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :preferences, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :userstatistiques, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
