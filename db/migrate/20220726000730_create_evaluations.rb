class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :type
      t.references :order, null: false, foreign_key: true
      t.boolean :good, null: false, default: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
