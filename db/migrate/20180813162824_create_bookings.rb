class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.date :start_date
      t.date :end_date
      t.text :purpose
      t.string :status, default: :pending
      t.integer :superhero_id
      t.integer :renter_id

      t.timestamps
    end

    add_foreign_key :bookings, :users, column: :renter_id
    add_index :bookings, :renter_id

    add_foreign_key :bookings, :superheroes, column: :superhero_id
    add_index :bookings, :superhero_id
  end
end
