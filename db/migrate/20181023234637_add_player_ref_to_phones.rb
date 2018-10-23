class AddPlayerRefToPhones < ActiveRecord::Migration[5.2]
  def change
    add_reference :phones, :player, foreign_key: true
  end
end
