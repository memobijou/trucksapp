# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170401205023) do

  create_table "days", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_supervisors", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "supervisor_id"
    t.integer  "priority"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "employee_supervisors", ["employee_id"], name: "index_employee_supervisors_on_employee_id"
  add_index "employee_supervisors", ["priority", "employee_id"], name: "index_employee_supervisors_on_priority_and_employee_id", unique: true
  add_index "employee_supervisors", ["supervisor_id", "employee_id"], name: "index_employee_supervisors_on_supervisor_id_and_employee_id", unique: true
  add_index "employee_supervisors", ["supervisor_id"], name: "index_employee_supervisors_on_supervisor_id"

  create_table "employee_vacations", force: :cascade do |t|
    t.integer  "employee_workinghour_id"
    t.date     "datum"
    t.boolean  "urlaub"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_vacations", ["employee_workinghour_id"], name: "index_employee_vacations_on_employee_workinghour_id"

  create_table "employee_workinghours", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "working_hour_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "employee_workinghours", ["employee_id"], name: "index_employee_workinghours_on_employee_id"
  add_index "employee_workinghours", ["working_hour_id"], name: "index_employee_workinghours_on_working_hour_id"

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "incomming_goods", force: :cascade do |t|
    t.integer  "truck_id"
    t.string   "ordernumber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "incomming_goods", ["truck_id"], name: "index_incomming_goods_on_truck_id"

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "outgoing_goods", force: :cascade do |t|
    t.integer  "truck_id"
    t.string   "request_number"
    t.string   "delivery_note_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "outgoing_goods", ["truck_id"], name: "index_outgoing_goods_on_truck_id"

  create_table "supervisors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "supervisors", ["user_id"], name: "index_supervisors_on_user_id"

  create_table "truck_employees", force: :cascade do |t|
    t.integer  "truck_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "truck_employees", ["employee_id"], name: "index_truck_employees_on_employee_id"
  add_index "truck_employees", ["truck_id"], name: "index_truck_employees_on_truck_id"

  create_table "truck_orders", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_truck_orders", force: :cascade do |t|
    t.integer  "truck_id"
    t.integer  "truck_order_id"
    t.time     "time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "notes"
  end

  add_index "truck_truck_orders", ["truck_id"], name: "index_truck_truck_orders_on_truck_id"
  add_index "truck_truck_orders", ["truck_order_id"], name: "index_truck_truck_orders_on_truck_order_id"

  create_table "trucks", force: :cascade do |t|
    t.integer  "unitload"
    t.integer  "numberpallets"
    t.string   "supplier"
    t.string   "licenseplate"
    t.string   "shippingagency"
    t.boolean  "occupied"
    t.boolean  "incoming"
    t.boolean  "outgoing"
    t.string   "ordernumber"
    t.string   "request_number"
    t.string   "delivery_note_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "claim_file_name"
    t.string   "claim_content_type"
    t.integer  "claim_file_size"
    t.datetime "claim_updated_at"
    t.datetime "completed_at"
    t.boolean  "completed"
  end

  create_table "users", force: :cascade do |t|
    t.string   "vorname"
    t.string   "nachname"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "working_hours", force: :cascade do |t|
    t.integer  "day_id"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "working_hours", ["day_id"], name: "index_working_hours_on_day_id"

end
