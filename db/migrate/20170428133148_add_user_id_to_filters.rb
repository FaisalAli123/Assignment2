class AddUserIdToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :user_id, :integer
  end
end
