class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :id_card
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.references :school, foreign_key: true
      t.references :period, foreign_key: true

      t.timestamps
    end
  end
end
