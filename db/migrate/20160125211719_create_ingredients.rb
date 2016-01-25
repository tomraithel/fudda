class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :quantity
      t.integer :product_id
      t.integer :receipe_id

      t.timestamps
    end
  end
end
