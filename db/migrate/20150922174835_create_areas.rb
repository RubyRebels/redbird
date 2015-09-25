class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name, required: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
