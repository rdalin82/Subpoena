class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.string :fax

      t.timestamps null: false
    end
  end
end
