class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.date :day
      t.integer :receipe_id

      t.timestamps
    end
  end
end
