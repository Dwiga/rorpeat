# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_23_071949) do

  create_table "another_books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authors", force: :cascade do |t|
    t.text "bio"
    t.string "name"
    t.string "countries"
    t.string "gender"
    t.integer "n_books"
    t.text "summary"
    t.datetime "born"
    t.datetime "died"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_tags", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_tags_on_book_id"
    t.index ["tag_id"], name: "index_book_tags_on_tag_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "content_name"
    t.string "isbn"
    t.string "original_title"
    t.integer "year"
    t.string "author_name"
    t.string "language_code"
    t.string "category"
    t.text "plot"
    t.string "copyright"
    t.string "title"
    t.float "average_rating"
    t.integer "rating_count"
    t.text "description"
    t.string "loc_class"
    t.string "language"
    t.string "countries"
    t.datetime "release_date"
    t.string "cover"
    t.boolean "content_cleaned"
    t.boolean "content_available"
    t.integer "n_authors"
    t.text "summary"
    t.integer "pages"
    t.string "isbn13"
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.text "message"
    t.integer "reference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gutenbergs", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "url"
    t.integer "num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_gutenbergs_on_book_id"
  end

  create_table "image_urls", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_image_urls_on_book_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_images_on_book_id"
  end

  create_table "similar_books", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "another_book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["another_book_id"], name: "index_similar_books_on_another_book_id"
    t.index ["book_id"], name: "index_similar_books_on_book_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wikipedia", force: :cascade do |t|
    t.string "url"
    t.boolean "found"
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_wikipedia_on_author_id"
  end

  create_table "wikipedics", force: :cascade do |t|
    t.string "url"
    t.boolean "found"
    t.integer "year"
    t.integer "book_id", null: false
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_wikipedics_on_book_id"
  end

  add_foreign_key "book_tags", "books"
  add_foreign_key "book_tags", "tags"
  add_foreign_key "books", "authors"
  add_foreign_key "gutenbergs", "books"
  add_foreign_key "image_urls", "books"
  add_foreign_key "images", "books"
  add_foreign_key "similar_books", "another_books"
  add_foreign_key "similar_books", "books"
  add_foreign_key "wikipedia", "authors"
  add_foreign_key "wikipedics", "books"
end
