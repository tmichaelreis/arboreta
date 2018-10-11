class CreateArboretaTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :arboreta_trees do |t|
      t.integer :subject_id
      t.string :subject_type
    end
  end
end
