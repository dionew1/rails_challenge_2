require 'rails_helper'

describe Book do
  it "invalid wihtout a title" do
    book = Book.new

    expect(book).to be_invalid
  end

  it "valid with a title" do
    book = Book.new(title: "Big")

    expect(book).to be_valid
  end

  it "is invalid if title is not unique" do
    Book.create(title: "Big")
    book = Book.create(title: "Big")

    expect(book).to be_invalid
  end

  it "is valid if title is unique" do
    Book.create(title: "Cinderella")
    book = Book.create(title: "Big")

    expect(book).to be_valid
  end

  it "has relationship to review" do
    book = Book.create(title: "Big")

    expect(book).to respond_to(:reviews)
  end

  it "has relationship to user" do
    book = Book.create(title: "Big")

    expect(book).to respond_to(:users)
  end

  it "has average_rating" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", rating: 4, user: user)
    book.reviews.create(body: "Okay", rating: 3, user: user)

    expect(book.average_rating).to eq 3.5
  end

  it "has highest_rating" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", rating: 4, user: user)
    book.reviews.create(body: "Okay", rating: 3, user: user)

    expect(book.highest_rating.first.rating).to eq 4
    expect(book.highest_rating.first.body).to eq "Great Book!"
    expect(book.highest_rating.first.user.name).to eq "Dee"
  end

  it "has lowest_rating" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", rating: 4, user: user)
    book.reviews.create(body: "Okay", rating: 3, user: user)

    expect(book.lowest_rating.first.rating).to eq 3
    expect(book.lowest_rating.first.body).to eq "Okay"
    expect(book.lowest_rating.first.user.name).to eq "Dee"
  end
end
