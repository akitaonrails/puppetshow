# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "fact_names", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "fact_names", ["name"], :name => "index_fact_names_on_name"

  create_table "fact_values", :force => true do |t|
    t.text     "value",        :null => false
    t.integer  "fact_name_id", :null => false
    t.integer  "host_id",      :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "fact_values", ["host_id"], :name => "index_fact_values_on_host_id"
  add_index "fact_values", ["fact_name_id"], :name => "index_fact_values_on_fact_name_id"

  create_table "hosts", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "ip"
    t.string   "environment"
    t.datetime "last_compile"
    t.datetime "last_freshcheck"
    t.datetime "last_report"
    t.datetime "updated_at"
    t.integer  "source_file_id"
    t.datetime "created_at"
  end

  add_index "hosts", ["name"], :name => "index_hosts_on_name"
  add_index "hosts", ["source_file_id"], :name => "index_hosts_on_source_file_id"

  create_table "param_names", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "param_names", ["name"], :name => "index_param_names_on_name"

  create_table "param_values", :force => true do |t|
    t.text     "value",         :null => false
    t.integer  "param_name_id", :null => false
    t.integer  "line"
    t.integer  "resource_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "param_values", ["resource_id"], :name => "index_param_values_on_resource_id"
  add_index "param_values", ["param_name_id"], :name => "index_param_values_on_param_name_id"

  create_table "puppet_tags", :force => true do |t|
    t.string   "name"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "puppet_tags", ["id"], :name => "index_puppet_tags_on_id"

  create_table "resource_tags", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "puppet_tag_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "resource_tags", ["puppet_tag_id"], :name => "index_resource_tags_on_puppet_tag_id"
  add_index "resource_tags", ["resource_id"], :name => "index_resource_tags_on_resource_id"

  create_table "resources", :force => true do |t|
    t.text     "title",          :null => false
    t.string   "restype",        :null => false
    t.integer  "host_id"
    t.integer  "source_file_id"
    t.boolean  "exported"
    t.integer  "line"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "resources", ["title", "restype"], :name => "index_resources_on_title_and_restype"
  add_index "resources", ["source_file_id"], :name => "index_resources_on_source_file_id"
  add_index "resources", ["host_id"], :name => "index_resources_on_host_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "source_files", :force => true do |t|
    t.string   "filename"
    t.string   "path"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "source_files", ["filename"], :name => "index_source_files_on_filename"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "username"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
