class CreateTShirts < ActiveRecord::Migration[5.2]
  def change
    create_table :t_shirts do |t|
      t.integer :dorsal_number
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
