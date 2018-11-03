class RemoveGameRefFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_reference :teams, :game, foreign_key: true
  end
end
