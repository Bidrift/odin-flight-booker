class BookingsController < ApplicationController
    def new
        unless booking_params
            flash['alert'] = "Missing booking parameters, select flight and number of passengers"
            redirect_to flights_path
            return
        end
        @booking = Booking.new(flight_id: booking_params[:flight_id])
        @passengers_count = booking_params[:passengers_count]
        @passengers_count.to_i.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_create_params)
        @passengers_count = booking_params[:passengers_count]
        if @booking.save
            redirect_to booking_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show

    end

    private

    def booking_params
        params.expect(booking: [:flight_id, :passengers_count])
        return false if params[:booking][:flight_id].nil? || params[:booking][:passengers_count].nil?
        params.expect(booking: [:flight_id, :passengers_count])
    rescue ActionController::ParameterMissing
        return false
    end

    def booking_passenger_params
        params.expect(booking: [:flight_id, :passengers_count, passengers_attributes: [[:name, :email]]])
    end

    def booking_create_params
        params.expect(booking: [:flight_id, passengers_attributes: [[:name, :email]]])
    end
end
