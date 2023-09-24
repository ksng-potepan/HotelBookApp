class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.text :accommodation
      t.text :guide
      t.integer :charge
      t.text :address

      t.timestamps
    end
  end
end
