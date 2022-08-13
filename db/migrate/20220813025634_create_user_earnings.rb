class CreateUserEarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_earnings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
