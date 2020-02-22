class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :registration_date

      t.timestamps
    end
  end
end
