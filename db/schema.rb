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

ActiveRecord::Schema.define(version: 20160812235958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cloud_accounts", force: :cascade do |t|
    t.string   "access_key_id"
    t.string   "cloud_provider"
    t.string   "name"
    t.string   "iam_role_arn"
    t.string   "secret_access_key"
    t.string   "access_method"
    t.string   "aws_cloud_partition"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "external_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name"
    t.string   "remarks"
    t.string   "snapshotid"
    t.string   "snapshotname"
    t.time     "to_time"
    t.boolean  "enabled"
    t.date     "from_date"
    t.boolean  "repeat"
    t.date     "to_date"
    t.string   "occurs"
    t.integer  "repeatdays"
    t.integer  "repeatweek"
    t.integer  "repeatmonth"
    t.integer  "weekdays"
    t.string   "repeats_monthly"
    t.string   "monthdays"
    t.integer  "repeats_monthly_on_ordinals_mask"
    t.integer  "repeats_monthly_on_days_of_the_week_mask"
    t.string   "cloud"
    t.string   "region"
    t.string   "action"
    t.string   "instanceid"
    t.time     "from_time"
    t.datetime "dat_tme"
    t.string   "timezone"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
