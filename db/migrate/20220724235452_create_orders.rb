class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :status, null: false, default: 10
      t.string :payment_method_id, null: false
      t.string :payer_family_name, null: false
      t.string :payer_given_name, null: false
      t.string :payer_family_name_kana, null: false
      t.string :payer_given_name_kana, null: false
      t.string :payer_postal_code, null: false
      t.string :payer_prefecture_id, null: false
      t.string :payer_city, null: false
      t.string :payer_line, null: false
      t.string :payer_building_name, null: false
      t.string :payer_phone_number, null: false

      t.timestamps
    end
  end
end
