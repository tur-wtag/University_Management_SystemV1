# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_27_081415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.string "room"
    t.string "time"
    t.integer "credit_hour"
    t.bigint "department_id", null: false
    t.bigint "faculty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
    t.index ["faculty_id"], name: "index_courses_on_faculty_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "chair"
    t.string "office_address"
    t.string "phone"
    t.string "name"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.decimal "grade"
    t.integer "semester"
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "email"
    t.string "phone"
    t.string "room"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_faculties_on_department_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "dean"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.decimal "cgpa"
    t.integer "credits_passed"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  add_foreign_key "courses", "departments"
  add_foreign_key "courses", "faculties"
  add_foreign_key "departments", "schools"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "faculties", "departments"
  add_foreign_key "students", "departments"
end
