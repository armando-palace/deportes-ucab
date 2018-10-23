class AddDetailsToUserTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :user_teams, :number, :integer
  end
end
