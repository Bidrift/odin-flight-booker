class FlightsController < ApplicationController

    def index
        @flight = Flight.new
        
        if flight_params
            @flight = Flight.new(flight_params)
            flash.now['notice'] = 'You have searched something'
            if @flight.valid?(:search)
                @flights = Flight.search_flights(@flight)
            end
        end
        @airports = Airport.all.map { |x| [x.id, x.code] }
    end
    
    private

    def flight_params
        params.expect(flight: [:departure_airport_id, :arrival_airport_id, :departure_time])
    rescue ActionController::ParameterMissing
        return false
    end
end
