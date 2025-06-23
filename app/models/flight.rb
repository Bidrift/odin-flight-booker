class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validate :airports_cannot_be_the_same
  validate :departure_time_cannot_be_in_the_past, on: :search

  enum :status, { ontime: 0, checkin: 1, boarding: 2, delayed: 3, cancelled: 4, departed: 5 }

  private

  def departure_time_cannot_be_in_the_past
    if departure_time.present? && departure_time < Date.today
      errors.add(:departure_time, "can't be in the past")
    end
  end

  def airports_cannot_be_the_same
    if departure_airport_id.present? && arrival_airport_id.present? && departure_airport_id == arrival_airport_id
      errors.add(:arrival_airport_id, "cannot be the same as departure airport.")
    end
  end
end
