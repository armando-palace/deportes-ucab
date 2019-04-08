class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :description
      t.date :registration_start_date
      t.date :registration_end_date
      t.string :period

      t.timestamps
    end
  end
end
