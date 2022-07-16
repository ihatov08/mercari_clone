class CreateUserInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_informations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
