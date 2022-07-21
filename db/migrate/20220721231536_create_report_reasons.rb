class CreateReportReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :report_reasons do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
