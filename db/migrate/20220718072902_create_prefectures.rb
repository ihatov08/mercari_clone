class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :name_en, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
