class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  validate :has_passengers, on: :fresh

  validate :has_no_more_than_4_passengers, on: :fresh

  accepts_nested_attributes_for :passengers

  private
    def has_passengers
      if passengers.none?
        errors.add(:booking, "must have at least one passenger")
      end
    end

    def has_no_more_than_4_passengers
      if passengers.size > 4
        errors.add(:passengers, "must not be over 4")
      end
    end
end
