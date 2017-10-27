require 'rails_helper'

describe Review do
  it "invalid wihtout a body" do
    review = Review.new

    expect(review).to be_invalid
  end

  it "valid with body" do
    user = User.create(name: "Dee")
    book = Book.create(title: "Book1")
    review = Review.new(body: "Great book!", book: book, user: user)

    expect(review).to be_valid
  end

  it "can provide book rating" do
    user = User.create(name: "Dee")
    book = Book.create(title: "Book1")
    review = Review.new(body: "Great book!", rating: 4, book: book, user: user)

    expect(review).to be_valid
    expect(review.rating).to eq 4
  end

  it "has relationship to book" do
    user = User.create(name: "Dee")
    book = Book.create(title: "Book1")
    review = Review.create(body: "Great book!", book: book, user: user)

    expect(review).to respond_to(:book)
  end

  it "has relationship to user" do
    user = User.create(name: "Dee")
    book = Book.create(title: "Book1")
    review = Review.create(body: "Great book!", book: book, user: user)

    expect(review).to respond_to(:user)
  end
end
