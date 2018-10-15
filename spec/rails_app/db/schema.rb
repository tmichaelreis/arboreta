# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_15_170123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arboreta_nodes", force: :cascade do |t|
    t.jsonb "input_data", default: "{}"
    t.string "operator", null: false
    t.boolean "is_root", default: false
    t.boolean "is_leaf"
    t.integer "positive_child_id"
    t.integer "negative_child_id"
    t.bigint "arboreta_tree_id"
    t.index ["arboreta_tree_id"], name: "index_arboreta_nodes_on_arboreta_tree_id"
  end

  create_table "arboreta_trees", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "subject_type"
    t.string "tree_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age", null: false
    t.decimal "weight", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
