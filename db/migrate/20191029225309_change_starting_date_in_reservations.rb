class ChangeStartingDateInReservations < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :starting_date, :string
  end
end
