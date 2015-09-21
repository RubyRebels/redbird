class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :state, limit: 2
      t.string :zip
      t.string :country, default: 'US', limit: 2
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
