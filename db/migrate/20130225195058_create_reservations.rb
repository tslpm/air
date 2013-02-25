class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :flight_id
      t.integer :user_id
      t.date :departs_on
      t.string :credit_card

      t.timestamps
    end
  end
end
