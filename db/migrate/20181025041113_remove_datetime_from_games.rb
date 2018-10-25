class RemoveDatetimeFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :start_datetime, :datetime
  end
end
