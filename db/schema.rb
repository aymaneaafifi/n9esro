
ActiveRecord::Schema[7.1].define(version: 2024_01_30_133400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date"
    t.bigint "terrain_id", null: false
    t.bigint "organizer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_matches_on_organizer_id"
    t.index ["terrain_id"], name: "index_matches_on_terrain_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_teams_on_match_id"
  end

  create_table "terrains", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.date "accepted_at"
    t.date "rejected_at"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"

    t.text "bio"

    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "terrains"
  add_foreign_key "matches", "users", column: "organizer_id"
  add_foreign_key "teams", "matches"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
