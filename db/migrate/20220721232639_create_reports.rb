class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.references :report_reason, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
