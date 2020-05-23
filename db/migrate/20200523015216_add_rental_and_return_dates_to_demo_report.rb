class AddRentalAndReturnDatesToDemoReport < ActiveRecord::Migration[6.0]
  def change
    add_column :demo_reports, :rental_date, :datetime
    add_column :demo_reports, :return_date, :datetime
  end
end
