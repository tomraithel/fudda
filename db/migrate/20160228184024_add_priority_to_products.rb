class AddPriorityToProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.integer :priority, default: 0
    end
  end
end
