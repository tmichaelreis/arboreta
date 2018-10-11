class CreateArboretaNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :arboreta_nodes do |t|
      t.integer :parent_id
    end
  end
end
