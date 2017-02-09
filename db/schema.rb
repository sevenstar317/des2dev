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

ActiveRecord::Schema.define(version: 20170206210943) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_ideas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id"
    t.integer "idea_id"
    t.index ["category_id"], name: "index_categories_ideas_on_category_id", using: :btree
    t.index ["idea_id"], name: "index_categories_ideas_on_idea_id", using: :btree
  end

  create_table "categories_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id"
    t.integer "project_id"
    t.index ["category_id"], name: "index_categories_projects_on_category_id", using: :btree
    t.index ["project_id"], name: "index_categories_projects_on_project_id", using: :btree
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "status"
    t.integer  "owner_id"
    t.text     "description",            limit: 65535
    t.string   "designer_participation"
    t.date     "deadline"
    t.text     "references",             limit: 65535
    t.text     "flow",                   limit: 65535
    t.float    "subtotal_price",         limit: 24
    t.integer  "discount"
    t.float    "total_price",            limit: 24
    t.float    "grand_total",            limit: 24
    t.boolean  "private_contest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["owner_id"], name: "index_ideas_on_owner_id", using: :btree
  end

  create_table "ideas_devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idea_id"
    t.integer  "device_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_ideas_devices_on_device_id", using: :btree
    t.index ["idea_id"], name: "index_ideas_devices_on_idea_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "file"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "active"
    t.string   "kind"
    t.string   "name"
    t.integer  "quantity",                  default: 1,   null: false
    t.float    "price",          limit: 24, default: 0.0, null: false
    t.float    "total",          limit: 24, default: 0.0, null: false
    t.string   "priceable_type"
    t.integer  "priceable_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["priceable_type", "priceable_id"], name: "index_prices_on_priceable_type_and_priceable_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "funding"
    t.integer  "reward"
    t.integer  "owner_id"
    t.string   "status"
    t.text     "our_story",   limit: 65535
    t.text     "our_team",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
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
    t.string   "name"
    t.string   "company"
    t.string   "country_code"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "address_2"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "billing_email"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories_ideas", "categories"
  add_foreign_key "categories_ideas", "ideas"
  add_foreign_key "categories_projects", "categories"
  add_foreign_key "categories_projects", "projects"
  add_foreign_key "ideas_devices", "devices"
  add_foreign_key "ideas_devices", "ideas"
end
