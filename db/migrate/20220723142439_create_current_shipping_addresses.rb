class CreateCurrentShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :current_shipping_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shipping_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
