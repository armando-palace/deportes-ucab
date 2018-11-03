class CreateWinnerTeamGames < ActiveRecord::Migration[5.2]
  def change
    create_table :winner_team_games do |t|
      t.references :team, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
