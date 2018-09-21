class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.string :period_number
      t.references :period_type, foreign_key: true

      t.timestamps
    end
  end
end
