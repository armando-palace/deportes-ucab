class AddFinishedStatusToPairings < ActiveRecord::Migration[5.2]
  def change
    add_column :pairings, :round_finished, :boolean
  end
end
