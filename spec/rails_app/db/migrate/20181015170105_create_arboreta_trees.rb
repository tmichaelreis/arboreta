class CreateArboretaTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :arboreta_trees do |t|
      t.integer :subject_id
      t.integer :subject_type

      t.string :tree_name

      t.boolean :template, default: false
    end
  end
end
