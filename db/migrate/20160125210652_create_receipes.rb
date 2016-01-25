class CreateReceipes < ActiveRecord::Migration[5.0]
  def change
    create_table :receipes do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :persons

      t.timestamps
    end
  end
end
