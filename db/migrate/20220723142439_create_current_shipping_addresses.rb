class CreateCurrentShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :current_shipping_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shipping_address, null: false, foreign_key: true
      t.index %i[user_id shipping_address_id],
        unique: true,
        name: "current_shipping_addresses_user_shipping_address_unique"

      t.timestamps
    end
  end
end
