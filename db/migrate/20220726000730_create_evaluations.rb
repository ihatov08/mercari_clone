class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :type
      t.references :order, null: false, foreign_key: true
      t.boolean :good
      t.text :comment

      t.timestamps
    end
  end
end
