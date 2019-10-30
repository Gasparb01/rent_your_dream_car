class AddEndDayToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :end_day, :string
  end
end
