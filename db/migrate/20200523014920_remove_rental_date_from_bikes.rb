class RemoveRentalDateFromBikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :bikes, :rental_date
  end
end
