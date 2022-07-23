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

ActiveRecord::Schema.define(version: 2022_07_23_142439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "current_shipping_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shipping_address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_address_id"], name: "index_current_shipping_addresses_on_shipping_address_id"
    t.index ["user_id", "shipping_address_id"], name: "current_shipping_addresses_user_shipping_address_unique", unique: true
    t.index ["user_id"], name: "index_current_shipping_addresses_on_user_id"
  end

  create_table "current_stripe_payments", force: :cascade do |t|
    t.bigint "stripe_customer_id", null: false
    t.bigint "stripe_payment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stripe_customer_id"], name: "index_current_stripe_payments_on_stripe_customer_id", unique: true
    t.index ["stripe_payment_id"], name: "index_current_stripe_payments_on_stripe_payment_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_favorites_on_item_id"
    t.index ["user_id", "item_id"], name: "index_favorites_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_item_categories_on_name", unique: true
  end

  create_table "item_conditions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_item_conditions_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.json "images", default: {}, null: false
    t.bigint "item_category_id", null: false
    t.bigint "item_condition_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "shipping_payer_type_id", null: false
    t.bigint "prefecture_id", null: false
    t.bigint "shipping_day_type_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
    t.index ["item_condition_id"], name: "index_items_on_item_condition_id"
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id"
    t.index ["shipping_day_type_id"], name: "index_items_on_shipping_day_type_id"
    t.index ["shipping_payer_type_id"], name: "index_items_on_shipping_payer_type_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
    t.index ["name_en"], name: "index_prefectures_on_name_en", unique: true
  end

  create_table "report_reasons", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_report_reasons_on_name", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
    t.bigint "report_reason_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_reports_on_comment_id"
    t.index ["report_reason_id"], name: "index_reports_on_report_reason_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "postal_code", null: false
    t.bigint "prefecture_id", null: false
    t.string "city", null: false
    t.string "line", null: false
    t.string "building_name", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_shipping_addresses_on_prefecture_id"
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "shipping_day_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_shipping_day_types_on_name", unique: true
  end

  create_table "shipping_payer_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_shipping_payer_types_on_name", unique: true
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_stripe_customers_on_customer_id", unique: true
    t.index ["user_id"], name: "index_stripe_customers_on_user_id", unique: true
  end

  create_table "stripe_payments", force: :cascade do |t|
    t.bigint "stripe_customer_id", null: false
    t.string "payment_id", null: false
    t.string "brand", null: false
    t.integer "exp_month", null: false
    t.integer "exp_year", null: false
    t.string "last4", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stripe_customer_id"], name: "index_stripe_payments_on_stripe_customer_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.date "birth_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "user_mobile_phones", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "number", null: false
    t.string "auth_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "verified", default: false, null: false
    t.index ["auth_code"], name: "index_user_mobile_phones_on_auth_code"
    t.index ["number"], name: "index_user_mobile_phones_on_number", unique: true
    t.index ["user_id"], name: "index_user_mobile_phones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname", null: false
    t.integer "gender", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "current_shipping_addresses", "shipping_addresses"
  add_foreign_key "current_shipping_addresses", "users"
  add_foreign_key "current_stripe_payments", "stripe_customers"
  add_foreign_key "current_stripe_payments", "stripe_payments"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "items", "item_categories"
  add_foreign_key "items", "item_conditions"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "shipping_day_types"
  add_foreign_key "items", "shipping_payer_types"
  add_foreign_key "items", "users"
  add_foreign_key "reports", "comments"
  add_foreign_key "reports", "report_reasons"
  add_foreign_key "reports", "users"
  add_foreign_key "shipping_addresses", "prefectures"
  add_foreign_key "shipping_addresses", "users"
  add_foreign_key "stripe_customers", "users"
  add_foreign_key "stripe_payments", "stripe_customers"
  add_foreign_key "user_informations", "users"
  add_foreign_key "user_mobile_phones", "users"
end
