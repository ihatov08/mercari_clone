class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :status
      t.string :payment_method_id
      t.string :payer_family_name
      t.string :payer_given_name
      t.string :payer_family_name_kana
      t.string :payer_given_name_kana
      t.string :payer_postal_code
      t.string :payer_prefecture_id
      t.string :payer_city
      t.string :payer_line
      t.string :payer_building_name
      t.string :payer_phone_number

      t.timestamps
    end
  end
end
