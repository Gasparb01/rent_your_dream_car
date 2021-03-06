class Car < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_many :reviews, dependent: :destroy
  CATEGORIES = ["Classic", "Convertible", "Coupe", "Exotic", "Sedan", "SUV", "Sport"]
  validates :model, :brand, :year, :category, :description, :photo, :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
