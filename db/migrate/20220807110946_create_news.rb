class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
