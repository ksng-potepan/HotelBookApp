class AddDataToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :staydays, :integer
    add_column :reservations, :payment, :integer
  end
end
