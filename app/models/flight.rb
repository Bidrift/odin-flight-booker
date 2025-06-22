class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  enum :status, { ontime: 0, checkin: 1, boarding: 2, delayed: 3, cancelled: 4, departed: 5 }
end
