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

ActiveRecord::Schema.define(version: 20160731055621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "protein_total"
    t.integer  "fat_total"
    t.integer  "carbohydrates_total"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "quantity"
    t.integer  "meal_category_id"
    t.integer  "calorie_total"
    t.index ["meal_category_id"], name: "index_meals_on_meal_category_id", using: :btree
    t.index ["user_id"], name: "index_meals_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "display_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "refresh_token"
    t.integer  "expires_at"
  end

  add_foreign_key "meals", "meal_categories"
  add_foreign_key "meals", "users"
end
