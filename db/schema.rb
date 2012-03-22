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

ActiveRecord::Schema.define(:version => 20120229001533) do

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "blogger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccls", :force => true do |t|
    t.string  "sbtnccft"
    t.string  "sbtnccftcode"
    t.boolean "select",       :default => false
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "blog_post_id"
    t.integer  "commenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fedbizs", :force => true do |t|
    t.string   "sbtnid"
    t.string   "sol_opp"
    t.string   "sol_num"
    t.string   "sol_date"
    t.string   "sol_state"
    t.string   "sol_type"
    t.string   "sol_naics"
    t.string   "sol_class"
    t.string   "sol_link"
    t.string   "sol_aside"
    t.string   "sol_agency"
    t.string   "sol_office"
    t.string   "sol_location"
    t.string   "sol_rdate"
    t.boolean  "select",       :default => false
    t.boolean  "interest",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "iedcoms"
    t.string   "vtp"
  end

  create_table "folders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jps", :force => true do |t|
    t.string   "sbtnid"
    t.string   "jpco"
    t.string   "jptitle"
    t.string   "jploc"
    t.string   "jpctype"
    t.string   "jpclass"
    t.string   "jpnaics"
    t.boolean  "select",     :default => false
    t.boolean  "interest",   :default => false
    t.text     "jptext"
    t.string   "grid_type"
    t.string   "iedcoms"
    t.string   "vtp"
    t.string   "vtpu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_copies", :force => true do |t|
    t.integer  "recipient_id"
    t.integer  "message_id"
    t.integer  "folder_id"
    t.boolean  "deleted",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "author_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mylists", :force => true do |t|
    t.string   "sbtnid"
    t.string   "ctractitle"
    t.string   "ctractdate"
    t.string   "ctractstate"
    t.string   "ctractnotice"
    t.string   "ctractclass"
    t.string   "ctractnaics"
    t.string   "ctractype"
    t.boolean  "select",       :default => false
    t.boolean  "interest",     :default => false
    t.string   "iedcoms"
    t.string   "grid_type"
    t.string   "record_id"
    t.string   "vtp"
    t.string   "vtpu"
    t.string   "retext"
    t.string   "retitle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "naics", :force => true do |t|
    t.string   "sbtnncode"
    t.string   "sbtngroup"
    t.boolean  "select",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "netzke_component_states", :force => true do |t|
    t.string   "component"
    t.integer  "user_id"
    t.integer  "role_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "netzke_component_states", ["component"], :name => "index_netzke_component_states_on_component"
  add_index "netzke_component_states", ["role_id"], :name => "index_netzke_component_states_on_role_id"
  add_index "netzke_component_states", ["user_id"], :name => "index_netzke_component_states_on_user_id"

  create_table "netzke_preferences", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "netzke_temp_table", :force => true do |t|
  end

  create_table "netzkecls", :force => true do |t|
    t.string  "ccftcode"
    t.string  "ccft"
    t.boolean "select",   :default => false
  end

  create_table "netzkenaics", :force => true do |t|
    t.string   "ncode"
    t.string   "ngroup"
    t.boolean  "select",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obvs", :force => true do |t|
    t.string   "sbtnid"
    t.string   "jpco"
    t.string   "jptitle"
    t.string   "jploc"
    t.string   "jpctype"
    t.string   "jpclass"
    t.string   "jpnaics"
    t.boolean  "select",     :default => false
    t.boolean  "interest",   :default => false
    t.text     "jptext"
    t.string   "grid_type"
    t.string   "iedcoms"
    t.string   "vtp"
    t.string   "vtpu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "content"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privateobvs", :force => true do |t|
    t.string   "sbtnid"
    t.string   "jpco"
    t.string   "jptitle"
    t.string   "jploc"
    t.string   "jpctype"
    t.string   "jpclass"
    t.string   "jpnaics"
    t.boolean  "select",     :default => false
    t.boolean  "interest",   :default => false
    t.text     "jptext"
    t.string   "grid_type"
    t.string   "iedcoms"
    t.string   "vtp"
    t.string   "vtpu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "setas", :force => true do |t|
    t.string   "seta"
    t.boolean  "select",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "abrev"
    t.string   "state"
    t.boolean  "select",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tcoms", :force => true do |t|
    t.string   "coname"
    t.string   "coweb"
    t.string   "conaics"
    t.string   "cocft"
    t.boolean  "select",        :default => false
    t.string   "cousername"
    t.string   "conum"
    t.string   "coanum"
    t.string   "coaddress"
    t.string   "cocity"
    t.string   "cozip"
    t.string   "costate"
    t.string   "coduns"
    t.string   "conemn"
    t.string   "cobizstruct"
    t.string   "cobsdate"
    t.string   "cofclear"
    t.string   "cocexp"
    t.string   "coprodser"
    t.string   "cofocus"
    t.string   "coifocus"
    t.string   "cokword"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_video"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "last_poster_id"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "coname"
    t.string   "coweb"
    t.string   "conaics"
    t.string   "cocft"
    t.string   "comylist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "user_name"
  end

end
