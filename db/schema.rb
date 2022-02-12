# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_12_084114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.float "rate"
    t.string "author_tip"
    t.string "budget"
    t.string "prep_time"
    t.string "ingredients", array: true
    t.string "name"
    t.string "author"
    t.string "difficulty"
    t.string "people_quantity"
    t.string "cook_time"
    t.string "tags", array: true
    t.string "total_time"
    t.string "image"
    t.string "nb_comments"
    t.string "ingredient_text"
    t.index "to_tsvector('english'::regconfig, (ingredient_text)::text)", name: "recipes_gin_ingredient_text", using: :gin
  end

end
