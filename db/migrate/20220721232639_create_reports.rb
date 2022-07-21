class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :report_reason, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
