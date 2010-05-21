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

ActiveRecord::Schema.define(:version => 20100521105419) do

  create_table "tasklist_demos", :force => true do |t|
    t.datetime "registered"
    t.datetime "deadline"
    t.float    "time_required"
    t.string   "assignee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "statustext"
    t.string   "status"
    t.string   "clientIP"
    t.integer  "versionnumber"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
  end

  add_index "tasklist_demos", ["status"], :name => "index_tasklist_demos_on_status"

end
