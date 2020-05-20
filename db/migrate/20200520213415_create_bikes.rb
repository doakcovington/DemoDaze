class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :category
      t.datetime :rental_date
      t.datetime :return_date
      t.belongs_to :dealer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
