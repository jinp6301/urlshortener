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

ActiveRecord::Schema.define(:version => 20130703185331) do

  create_table "comments", :force => true do |t|
    t.string  "comment"
    t.integer "short_url_id"
    t.integer "user_id"
  end

  create_table "long_urls", :force => true do |t|
    t.string "long_url"
  end

  create_table "long_urls1", :force => true do |t|
    t.string "long_url"
  end

  create_table "short_urls", :force => true do |t|
    t.string  "short_url"
    t.integer "long_url_id"
    t.integer "user_id"
  end

  create_table "tag_topics", :force => true do |t|
    t.string  "tag_topic"
    t.integer "short_url_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer "tag_id"
    t.integer "short_url_id"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "email"
  end

  create_table "visits", :force => true do |t|
    t.integer "visit"
    t.integer "unique"
    t.integer "short_url_id"
  end

  create_table "visits_per_users", :force => true do |t|
    t.integer  "short_url_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
