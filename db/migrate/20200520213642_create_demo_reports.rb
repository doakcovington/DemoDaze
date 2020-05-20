class CreateDemoReports < ActiveRecord::Migration[6.0]
  def change
    create_table :demo_reports do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :bike, null: false, foreign_key: true
      t.string :location
      t.string :report

      t.timestamps
    end
  end
end
