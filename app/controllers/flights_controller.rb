class FlightsController < ApplicationController

    def index
        @flight = Flight.new
        
        if flight_params
            @flight = Flight.new(flight_params)
            logger.debug(@flight)
            flash.now['notice'] = 'You have searched something'
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
