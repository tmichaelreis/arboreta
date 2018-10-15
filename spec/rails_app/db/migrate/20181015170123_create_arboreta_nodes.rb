class CreateArboretaNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :arboreta_nodes do |t|
      t.jsonb :input_data, default: '{}'
      t.string :operator, null: false

      t.boolean :is_root, default: false
      t.boolean :is_leaf, defailt: false

      t.integer :positive_child_id
      t.integer :negative_child_id

      t.belongs_to :arboreta_tree
    end
  end
end
