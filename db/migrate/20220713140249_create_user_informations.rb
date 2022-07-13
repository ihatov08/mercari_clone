class CreateUserInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_informations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :family_name
      t.string :given_name
      t.string :family_name_kana
      t.string :given_name_kana
      t.date :birth_date

      t.timestamps
    end
  end
end
