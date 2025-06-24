# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports_list = [ "ICN", "SHA", "SZX", "AYT", "ZRH", "IAD" ]

airports_list.each do |code|
    Airport.find_or_create_by!(code: code)
end

1000.times do |x|
    departure_airport, arrival_airport = Airport.all.sample(2).map(&:id)
    departure_time = DateTime.now + 2.hours + (10*x).minutes
    duration = ((1+rand(6)).hours + (rand(12)*5).minutes).in_minutes.to_i
    status = :ontime


    Flight.find_or_create_by!(departure_airport_id: departure_airport,
        arrival_airport_id: arrival_airport,
        departure_time: departure_time,
        duration: duration,
        status: status)
end
