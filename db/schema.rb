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

ActiveRecord::Schema.define(version: 2018_10_25_234405) do

  create_table "games", force: :cascade do |t|
    t.integer "pairing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.time "start_time"
    t.index ["pairing_id"], name: "index_games_on_pairing_id"
  end

  create_table "pairings", force: :cascade do |t|
    t.string "name"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_pairings_on_tournament_id"
  end

  create_table "period_types", force: :cascade do |t|
    t.boolean "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string "period_number"
    t.integer "period_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["period_type_id"], name: "index_periods_on_period_type_id"
  end

  create_table "phone_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.integer "phone_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.index ["phone_type_id"], name: "index_phones_on_phone_type_id"
    t.index ["player_id"], name: "index_phones_on_player_id"
  end

  create_table "player_teams", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_teams_on_player_id"
    t.index ["team_id"], name: "index_player_teams_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "id_card"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "school_id"
    t.integer "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["period_id"], name: "index_players_on_period_id"
    t.index ["school_id"], name: "index_players_on_school_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_shirts", force: :cascade do |t|
    t.integer "dorsal_number"
    t.integer "player_id"
    t.integer "team_id"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_t_shirts_on_player_id"
    t.index ["team_id"], name: "index_t_shirts_on_team_id"
    t.index ["tournament_id"], name: "index_t_shirts_on_tournament_id"
  end

  create_table "team_games", force: :cascade do |t|
    t.integer "team_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_team_games_on_game_id"
    t.index ["team_id"], name: "index_team_games_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.integer "sport_id"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_teams_on_game_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "registration_start_date"
    t.date "registration_end_date"
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "sport_id"
    t.index ["sport_id"], name: "index_tournaments_on_sport_id"
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
