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

ActiveRecord::Schema.define(version: 2023_08_03_134317) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

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
    t.integer "user_id"
    t.index ["user_id"], name: "index_beers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.index ["beer_id"], name: "index_comments_on_beer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_beers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_favorite_beers_on_beer_id"
    t.index ["user_id"], name: "index_favorite_beers_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "beer_rating"
    t.index ["beer_id"], name: "index_ratings_on_beer_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.integer "age"
    t.integer "phone_number"
    t.string "address"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_users_comments_on_beer_id"
    t.index ["user_id"], name: "index_users_comments_on_user_id"
  end

  add_foreign_key "beers", "users"
  add_foreign_key "comments", "beers"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_beers", "beers"
  add_foreign_key "favorite_beers", "users"
  add_foreign_key "ratings", "beers"
  add_foreign_key "ratings", "users"
  add_foreign_key "users_comments", "beers"
  add_foreign_key "users_comments", "users"
end
