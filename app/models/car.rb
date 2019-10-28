class Car < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  CATEGORIES = ["Classic", "Convertible", "Coupe", "Exotic", "Sedan", "SUV"]
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end
