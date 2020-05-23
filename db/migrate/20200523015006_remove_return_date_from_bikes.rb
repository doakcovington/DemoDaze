class RemoveReturnDateFromBikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :bikes, :return_date
  end
end
