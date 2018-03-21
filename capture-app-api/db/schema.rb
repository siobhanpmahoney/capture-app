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

ActiveRecord::Schema.define(version: 20180220230800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string "title"
    t.string "source_name"
    t.text "summary"
    t.string "url"
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_bookmarks_on_company_id"
    t.index ["job_id"], name: "index_bookmarks_on_job_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "location"
    t.text "description"
    t.integer "museId"
    t.string "twitter"
    t.string "image_link"
    t.string "image_link2"
    t.string "image_mini"
    t.string "company_logo"
    t.string "industry_name"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "date_published"
    t.text "contents"
    t.integer "museId"
    t.string "location"
    t.string "level"
    t.datetime "date_saved"
    t.boolean "overall_active_status"
    t.boolean "applied_status"
    t.string "date_applied"
    t.string "application_response_status"
    t.boolean "interview_invite"
    t.string "interview_1_date"
    t.string "interview_1_type"
    t.boolean "interview_1_technical"
    t.string "interview_1_response"
    t.string "interview_2_date"
    t.string "interview_2_type"
    t.boolean "interview_2_technical"
    t.string "interview_2_response"
    t.string "interview_3_date"
    t.string "interview_3_type"
    t.boolean "interview_3_technical"
    t.string "interview_3_response"
    t.boolean "offer_status"
    t.string "company_name"
    t.string "company_industry"
    t.string "category_name"
    t.integer "company_museId"
    t.bigint "company_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_jobs_on_category_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_notes_on_company_id"
    t.index ["job_id"], name: "index_notes_on_job_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "user_jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_user_jobs_on_job_id"
    t.index ["user_id"], name: "index_user_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
