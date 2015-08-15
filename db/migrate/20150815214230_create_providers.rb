class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :doctor
      t.text :firstlineaddress
      t.text :secondlineaddress
      t.text :citystatezip

      t.timestamps null: false
    end
  end
end
