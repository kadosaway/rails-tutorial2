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

ActiveRecord::Schema.define(version: 201710300000000) do

  create_table "ats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "belong_id",                unsigned: true
    t.string   "belong_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["belong_id"], name: "index_ats_on_belong_id", using: :btree
    t.index ["belong_type"], name: "index_ats_on_belong_type", using: :btree
    t.index ["deleted_at"], name: "index_ats_on_deleted_at", using: :btree
    t.index ["type", "belong_id", "belong_type"], name: "index_ats_on_type_and_belong_id_and_belong_type", using: :btree
    t.index ["type"], name: "index_ats_on_type", using: :btree
    t.index ["updated_at"], name: "index_ats_on_updated_at", using: :btree
  end

  create_table "rels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "type"
    t.integer "f_id"
    t.string  "f_type"
    t.integer "l_id"
    t.string  "l_type"
    t.index ["f_id"], name: "index_rels_on_f_id", using: :btree
    t.index ["f_type"], name: "index_rels_on_f_type", using: :btree
    t.index ["l_id"], name: "index_rels_on_l_id", using: :btree
    t.index ["l_type"], name: "index_rels_on_l_type", using: :btree
    t.index ["type", "f_id", "f_type", "l_id", "l_type"], name: "index_rels_on_type_and_f_id_and_f_type_and_l_id_and_l_type", using: :btree
    t.index ["type"], name: "index_rels_on_type", using: :btree
  end

  create_table "strs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "value"
    t.string  "type"
    t.integer "belong_id",   unsigned: true
    t.string  "belong_type"
    t.index ["belong_id"], name: "index_strs_on_belong_id", using: :btree
    t.index ["belong_type"], name: "index_strs_on_belong_type", using: :btree
    t.index ["type", "belong_id", "belong_type"], name: "index_strs_on_type_and_belong_id_and_belong_type", using: :btree
    t.index ["type"], name: "index_strs_on_type", using: :btree
    t.index ["value"], name: "index_strs_on_value", using: :btree
  end

  create_table "txts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "value",       limit: 65535
    t.string  "type"
    t.integer "belong_id",                 unsigned: true
    t.string  "belong_type"
    t.index ["belong_id"], name: "index_txts_on_belong_id", using: :btree
    t.index ["belong_type"], name: "index_txts_on_belong_type", using: :btree
    t.index ["type", "belong_id", "belong_type"], name: "index_txts_on_type_and_belong_id_and_belong_type", using: :btree
    t.index ["type"], name: "index_txts_on_type", using: :btree
    t.index ["value"], name: "index_txts_on_value", length: { value: 255 }, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
