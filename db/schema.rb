# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_28_112503) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "tagline"
    t.string "first_brewed"
    t.string "description"
    t.string "alcohol_by_volume"
    t.string "ibu"
    t.string "ebc"
    t.string "srm"
    t.string "ph"
    t.string "attenuation_level"
    t.json "volume"
    t.json "boil_volume"
    t.json "method"
    t.json "ingredients"
    t.json "food_pairing"
    t.string "brewers_tips"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
