class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
