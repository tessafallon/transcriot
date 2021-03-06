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

ActiveRecord::Schema.define(version: 20140220184428) do

  create_table "claim_examiners", force: true do |t|
    t.integer "claim_id"
    t.integer "examiner_id"
  end

  create_table "claims", force: true do |t|
    t.date    "claim_date"
    t.date    "incident_date"
    t.date    "resolution_date"
    t.integer "claim_number"
    t.integer "record_number"
    t.string  "incident_address"
    t.string  "incident_address_type"
    t.float   "total_claimed"
    t.float   "total_awarded"
  end

  create_table "examiners", force: true do |t|
    t.string "name"
  end

  create_table "people", force: true do |t|
    t.string  "name"
    t.string  "previous_address"
    t.string  "current_address"
    t.string  "role"
    t.string  "gender"
    t.string  "race"
    t.integer "claim_id"
  end

end
