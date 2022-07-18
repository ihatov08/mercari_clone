class CreateShippingDayTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_day_types do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
