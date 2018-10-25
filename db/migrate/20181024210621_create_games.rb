class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :start_datetime
      t.references :pairing, foreign_key: true

      t.timestamps
    end
  end
end
