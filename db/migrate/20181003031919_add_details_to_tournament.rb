class AddDetailsToTournament < ActiveRecord::Migration[5.2]
  def change
    add_reference :tournaments, :user, foreign_key: true
    add_reference :tournaments, :sport, foreign_key: true
  end
end
