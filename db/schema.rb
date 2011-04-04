# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100705131655) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_logs", :force => true do |t|
    t.integer  "device_id"
    t.integer  "holder_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_requests", :force => true do |t|
    t.integer  "device_id"
    t.integer  "requesting_holder_id"
    t.integer  "requested_holder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", :force => true do |t|
    t.string   "devicetype"
    t.string   "description"
    t.integer  "imei",            :limit => 8
    t.date     "received"
    t.string   "serialnumber"
    t.string   "borrowedfrom"
    t.text     "comments"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "returned"
    t.integer  "holder_id"
    t.integer  "device_type_id"
    t.string   "lent_to_details"
    t.integer  "borrower_id"
  end

  create_table "holder_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holders", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password",     :default => "",    :null => false
    t.string   "password_salt",        :default => "",    :null => false
    t.string   "persistence_token",    :default => "",    :null => false
    t.boolean  "admin",                :default => false
    t.integer  "team_id",              :default => 0
    t.string   "perishable_token",     :default => "",    :null => false
    t.float    "year_holidays",        :default => 25.0,  :null => false
    t.float    "transferred_holidays", :default => 0.0,   :null => false
  end

  add_index "holders", ["perishable_token"], :name => "index_holders_on_perishable_token"

  create_table "holiday_bookings", :force => true do |t|
    t.float    "nb_days",    :default => 0.0,   :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "validated",  :default => false, :null => false
    t.integer  "holder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id",    :default => 0
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_manager_id"
  end

end
