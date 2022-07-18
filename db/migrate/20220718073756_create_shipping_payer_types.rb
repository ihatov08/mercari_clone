class CreateShippingPayerTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_payer_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
