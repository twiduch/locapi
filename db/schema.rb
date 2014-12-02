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

ActiveRecord::Schema.define(version: 20141202000213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string   "country_code"
    t.integer  "panel_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["panel_provider_id"], name: "index_countries_on_panel_provider_id", using: :btree

  create_table "location_groups", force: true do |t|
    t.string   "name"
    t.integer  "panel_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_groups", ["panel_provider_id"], name: "index_location_groups_on_panel_provider_id", using: :btree

  create_table "location_groups_locations", id: false, force: true do |t|
    t.integer "location_id",       null: false
    t.integer "location_group_id", null: false
  end

  add_index "location_groups_locations", ["location_group_id", "location_id"], name: "index_loc_group_loc", using: :btree
  add_index "location_groups_locations", ["location_id", "location_group_id"], name: "index_loc_loc_group", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_code"
  end

  create_table "panel_providers", force: true do |t|
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "target_group_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "target_group_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "anc_desc_idx", unique: true, using: :btree
  add_index "target_group_hierarchies", ["descendant_id"], name: "desc_idx", using: :btree

  create_table "target_groups", force: true do |t|
    t.string   "name"
    t.string   "uuid"
    t.integer  "panel_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "secret_code"
  end

  add_index "target_groups", ["panel_provider_id"], name: "index_target_groups_on_panel_provider_id", using: :btree

end
