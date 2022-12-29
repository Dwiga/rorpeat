# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'byebug'

puts "Start seeding..."
puts "Authors seeding..."

author_file = File.read(Rails.root.join("db/authors.json"))
author_data = JSON.parse(author_file)

book_file = File.read(Rails.root.join("db/books.json"))
book_data = JSON.parse(book_file)

author_data["authors"].each do |a|
    author = Author.create(
        bio: a["bio"],
        name: a["name"],
        countries: a["countries"],
        gender: a["gender"],
        n_books: a["n_books"],
        summary: a["summary"],
        born: a["born"].present? ? a["born"].to_datetime : nil,
        died: a["died"].present? ? a["died"].to_datetime : nil
    )

    if a["wikipedia"].present?
        author.build_wikipedium(
            url: a["wikipedia"]["url"],
            found: a["wikipedia"]["found"]
        )
        author.save
    end

    a["books"].each do |i|
        b = book_data["books"][i-1]
        book = author.books.build(
            content_name: b["content_name"],
            isbn: b["isbn"],
            original_title: b["original_title"],
            year: b["year"],
            author_name: b["author_name"],
            language_code: b["language_code"],
            category: b["category"],
            plot: b["plot"],
            copyright: b["copyright"],
            title: b["title"],
            average_rating: b["average_rating"],
            rating_count: b["rating_count"],
            description: b["description"],
            loc_class: b["loc_class"],
            pages: b["pages"],
            language: b["language"],
            isbn13: b["isbn13"],
            countries: b["countries"],
            release_date: b["release_date"].present? ? b["release_date"].to_datetime : nil,
            cover: b["cover"],
            summary: b["summary"],
            content_cleaned: b["content_cleaned"],
            content_available: b["content_available"],
            n_authors: b["n_authors"]
        )
        book.save

        if b["image_urls"].present?
            b["image_urls"].each do |image_url|
                book.image_urls.build(
                    url: image_url
                )
                book.save
            end
        end

        if b["images"].present?
            b["images"].each do |image|
                book.images.build(
                    url: image
                )
                book.save
            end
        end

        if b["wikipedia"].present?
            book.wikipedics.build(
                url: b["wikipedia"]["url"],
                found: b["wikipedia"]["found"],
                year: b["wikipedia"]["year"],
                source: "wikipedia"
            )
            book.save
        end

        if b["goodreads"].present?
            book.wikipedics.build(
                url: b["goodreads"]["url"],
                found: b["goodreads"]["found"],
                year: b["goodreads"]["year"],
                source: "goodreads"
            )
            book.save
        end

        if b["similar_books"].present?
            b["similar_books"].each do |similar|
                another_book = AnotherBook.find_or_create_by(name: similar)
                SimilarBook.create(book_id: book.id, another_book_id: another_book.id)
            end
        end

        if b["gutenberg"].present?
            book.build_gutenberg(
                url: b["gutenberg"]["url"],
                num: b["gutenberg"]["num"]
            )
            book.save
        end

        if b["classes"].present?
            b["classes"].each do |t|
                tag = Tag.find_or_create_by(name: t)
                BookTag.create(book_id: book.id, tag_id: tag.id)
            end
        end
    end
end
puts "Seeding finished!"