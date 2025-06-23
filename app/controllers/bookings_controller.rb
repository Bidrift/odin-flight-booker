class BookingsController < ApplicationController
    def new
        unless booking_params
            flash['alert'] = "Missing booking parameters, select flight and number of passengers"
            redirect_to flights_path
            return
        end
        @booking = Booking.new(flight_id: booking_params[:flight_id])
        @passengers = Array.new
        booking_params[:passengers].to_i.times { @passengers << @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_create_params)
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
        params.expect(booking: [:flight_id, :passengers])
        return false if params[:booking][:flight_id].nil? || params[:booking][:passengers].nil?
        params.expect(booking: [:flight_id, :passengers])
    rescue ActionController::ParameterMissing
        return false
    end

    def booking_passenger_params
        params.expect(booking: [:flight_id, :passengers, passenger: [[:name, :email]]])
    end

    def booking_create_params
        params.expect(booking: [:flight_id, passenger: [[:name, :email]]])
    end
end
