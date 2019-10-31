class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validate :user_booked_the_car
  validates :content, presence: true

  private

  def user_booked_the_car
    unless user.reservations.where(car: car).any?
      errors.add(:user, 'has not booked this car')
    end
  end
end
