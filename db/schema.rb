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

ActiveRecord::Schema.define(version: 2020_04_28_085532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deposits", force: :cascade do |t|
    t.string "phone_number"
    t.float "new_deposit"
    t.float "balance"
    t.integer "pin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sends", force: :cascade do |t|
    t.string "senders_phone_number", null: false
    t.string "receivers_phone_number", null: false
    t.float "amount", null: false
    t.float "balance", null: false
    t.integer "pin", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "id_number", null: false
    t.string "phone_number", null: false
    t.integer "pin", default: 1234
    t.float "balance", default: 0.0, null: false
    t.string "password_confirmation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "withdrawals", force: :cascade do |t|
    t.string "phone_number", null: false
    t.string "agent_number", null: false
    t.float "amount", null: false
    t.integer "pin", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
