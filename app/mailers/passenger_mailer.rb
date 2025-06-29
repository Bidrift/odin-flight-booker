class PassengerMailer < ApplicationMailer
    default from: "notifications@example.com"

    def confirm_booking
        @passenger = params[:passenger]
        @url = params[:url]
        mail(to: @passenger.email, subject: "Booking Confirmation for Flight to "+@passenger.booking.flight.arrival_airport.code)
    end
end
