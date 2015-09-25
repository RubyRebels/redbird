# Most from:
#   rails g model User name admin:boolean email
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name,  null: false
      t.boolean :admin, null: false, default: false
      t.string  :email, null: false, default: ''

      t.timestamps null: false
    end
  end
end
