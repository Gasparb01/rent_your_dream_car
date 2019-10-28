class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :date, presence: true
  validates :price, presence: true
  validates :starting_date, presence: true
end
