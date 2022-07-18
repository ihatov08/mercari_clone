class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item_category, null: false, foreign_key: true
      t.references :item_condition, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.references :shipping_payer_type, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :shipping_day_type, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
