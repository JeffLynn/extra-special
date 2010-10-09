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

ActiveRecord::Schema.define(:version => 20101009094437) do

  create_table "applications", :force => true do |t|
    t.string   "name_of_applicant"
    t.string   "address_of_applicant"
    t.string   "name_of_applicants_supporter"
    t.string   "contact_details_of_supporter"
    t.text     "what_applicant_is_applying_for"
    t.text     "relevant_information"
    t.text     "details_of_cost"
    t.string   "other_contributions",                       :limit => 100
    t.string   "amount_requested_from_extra_special_trust", :limit => 100
    t.boolean  "registered_care_allowance",                                :default => false, :null => false
    t.boolean  "supported_living_allowance",                               :default => false, :null => false
    t.boolean  "domiciliary_allowance",                                    :default => false, :null => false
    t.datetime "accepted_terms_and_conditions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text"
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 50,  :null => false
    t.string   "account",         :limit => 20,  :null => false
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password", :limit => 50,  :null => false
    t.string   "salt",            :limit => 50,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account"], :name => "index_users_on_account", :unique => true

end
