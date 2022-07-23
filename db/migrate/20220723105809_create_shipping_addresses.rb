class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :family_name
      t.string :given_name
      t.string :family_name_kana
      t.string :given_name_kana
      t.string :postal_code
      t.references :prefecture, null: false, foreign_key: true
      t.string :city
      t.string :line
      t.string :building_name
      t.string :phone_number

      t.timestamps
    end
  end
end
