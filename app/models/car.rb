class Car < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  CATEGORIES = ["Classic", "Convertible", "Coupe", "Exotic", "Sedan", "SUV", "Sport"]
  validates :model, :brand, :year, :category, :description, :photo, presence: true
end
