class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  validate :has_passengers

  private
    def has_passengers
      if passengers.none?
        errors.add(:booking, "must have at least one passenger")
      end
    end
end
