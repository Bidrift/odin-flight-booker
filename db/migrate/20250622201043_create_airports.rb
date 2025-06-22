class CreateAirports < ActiveRecord::Migration[8.0]
  def change
    create_table :airports do |t|
      t.text :code, limit: 3

      t.timestamps
    end
  end
end
