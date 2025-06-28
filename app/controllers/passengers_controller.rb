class PassengersController < ApplicationController
    def create
        @passenger = Passenger.new(passenger_params)
        respond_to do |format|
            if @passenger.save
                format.turbo_stream { render turbo_stream: turbo_stream.append('passengers', @passenger)}
            else
                head(:unprocessable_entity)
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
            params.expect(passenger: [:name, :email])
        end
end
