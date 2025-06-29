class PassengersController < ApplicationController
    def create
        @passenger = Passenger.new(passenger_params)
        respond_to do |format|
            if @passenger.save
                format.turbo_stream { render turbo_stream: [turbo_stream.append('passengers-list', @passenger)]}
            else
                logger.debug(@passenger.errors.full_messages)
                format.turbo_stream { head(:unprocessable_entity) }
            end
        end
        
    end

    def destroy
        @passenger = Passenger.find(params[:id])
        respond_to do |format|
            if @passenger.destroy
                format.turbo_stream { render turbo_stream: turbo_stream.remove(@passenger)}
            else
                head(:unprocessable_entity)
            end
        end
    end

    private

        def passenger_params
            params.expect(passenger: [:name, :email, :booking_id])
        end
end
