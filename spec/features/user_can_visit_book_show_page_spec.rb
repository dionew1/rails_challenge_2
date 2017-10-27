require 'rails_helper'

describe "User can visit a show page" do
  scenario "user can see a show page for book" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", user: user)
    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.reviews.last.body)
    expect(page).to have_content(book.reviews.last.user.name)
    expect(page).to have_content(book.reviews.last.rating)
  end

  scenario "user can see average rating for book" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", rating: 4, user: user)
    book.reviews.create(body: "Okay", rating: 3, user: user)
    book.reviews.create(body: "Lacked in character development", rating: 2, user: user)
    book.reviews.create(body: "Awesome", rating: 5, user: user)
    visit book_path(book)

    expect(page).to have_content(book.average_rating)
    expect(page).to have_content(book.highest_rating.first.rating)
    expect(page).to have_content(book.highest_rating.first.body)
    expect(page).to have_content(book.highest_rating.first.user.name)
    expect(page).to have_content(book.lowest_rating.first.rating)
    expect(page).to have_content(book.lowest_rating.first.body)
    expect(page).to have_content(book.lowest_rating.first.user.name)
  end
end
