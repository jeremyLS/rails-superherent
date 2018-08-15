  class CreateSuperheroes < ActiveRecord::Migration[5.2]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.string :address
      t.string :power
      t.text :description
      t.boolean :good, default: true
      t.string :photo
      t.integer :daily_price
      t.integer :owner_id

      t.timestamps
    end

    add_foreign_key :superheroes, :users, column: :owner_id
    add_index :superheroes, :owner_id
  end
end
