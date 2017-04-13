class AddFilterIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :filter_id, :integer
  end
end
