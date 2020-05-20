class AddUserIdToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :user_id, :integer
  end
end
