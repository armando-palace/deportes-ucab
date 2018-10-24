class CreatePairings < ActiveRecord::Migration[5.2]
  def change
    create_table :pairings do |t|
      t.string :name
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
