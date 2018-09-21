class CreatePeriodTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :period_types do |t|
      t.boolean :semester

      t.timestamps
    end
  end
end
