class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age, null: false
      t.decimal :weight, precision: 5, scale: 2

      t.timestamps
    end
  end
end
