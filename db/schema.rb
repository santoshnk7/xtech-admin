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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140112063625) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "alerts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "warning_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alerts", ["user_id"], :name => "index_alerts_on_user_id"
  add_index "alerts", ["warning_id"], :name => "index_alerts_on_warning_id"

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.string  "photo"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
  end

  create_table "categories_places", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "place_id"
  end

  add_index "categories_places", ["category_id"], :name => "index_categories_places_on_category_id"
  add_index "categories_places", ["place_id"], :name => "index_categories_places_on_place_id"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "approx_latitude"
    t.string   "approx_longitude"
    t.string   "actual_latitude"
    t.string   "actual_longitude"
    t.integer  "user_id"
    t.string   "status",                                         :default => "Pending"
    t.string   "featured_photo"
    t.datetime "info_updated_at"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.decimal  "rating",           :precision => 3, :scale => 2, :default => 0.0
    t.string   "contact_photo"
    t.string   "contact_detail"
    t.string   "location"
    t.datetime "attrs_updated_at"
  end

  create_table "places_users", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "user_id"
  end

  add_index "places_users", ["place_id"], :name => "index_places_users_on_place_id"
  add_index "places_users", ["user_id"], :name => "index_places_users_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.decimal  "value",      :precision => 3, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "ratings", ["place_id"], :name => "index_ratings_on_place_id"
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.text     "message"
    t.string   "status",     :default => "Pending"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "reviews", ["place_id"], :name => "index_reviews_on_place_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "tips", :force => true do |t|
    t.integer  "place_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tips", ["place_id"], :name => "index_tips_on_place_id"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mobile_no"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "country"
    t.datetime "db_updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "warnings", :force => true do |t|
    t.integer  "place_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "warnings", ["place_id"], :name => "index_warnings_on_place_id"

end
