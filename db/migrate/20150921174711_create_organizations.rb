class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, required: true

      t.timestamps null: false
    end
  end
end
