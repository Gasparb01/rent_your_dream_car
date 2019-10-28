class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.integer :price
      t.date :starting_date
      t.integer :days

      t.timestamps
    end
  end
end
