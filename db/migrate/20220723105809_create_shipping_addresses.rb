class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :postal_code, null: false
      t.references :prefecture, null: false, foreign_key: true
      t.string :city, null: false
      t.string :line, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
