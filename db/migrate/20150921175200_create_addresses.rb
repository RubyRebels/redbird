class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address, required: true
      t.string :city, required: true
      t.string :state, limit: 2, required: true
      t.string :zip, required: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
