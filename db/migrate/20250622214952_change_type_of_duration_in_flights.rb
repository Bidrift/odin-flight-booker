class ChangeTypeOfDurationInFlights < ActiveRecord::Migration[8.0]
  def change
    remove_column :flights, :duration
    add_column :flights, :duration, :integer
  end
end
