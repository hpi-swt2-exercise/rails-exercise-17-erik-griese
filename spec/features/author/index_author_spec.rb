require 'rails_helper'

describe "Author index page", type: :feature do
  
  it "should render the author index page" do
    visit authors_path
  end

  it "should list author names and their homepages" do
    author = FactoryGirl.create :author

    visit authors_path
    expect(page).to have_text(author.name)
    expect(page).to have_text(author.homepage)

    author.destroy
  end

  it "should have a link to the new author page" do
    visit authors_path

    expect(page).to have_link("Add author", href: new_author_path)
  end

  it "should have a show link for each author" do
    author = FactoryGirl.create :author
    
    visit authors_path
    expect(page).to have_link("Show", href: author_path(author))

    author.destroy
  end

  it "should have an edit link for each author" do
    author = FactoryGirl.create :author

    visit authors_path
    expect(page).to have_link("Edit", href: edit_author_path(author))

    author.destroy
  end

  it "should have a destroy link" do
    author = FactoryGirl.create :author

    visit authors_path
    expect(page).to have_link('Destroy', href: author_path(author))

    author.destroy
  end

  it "should successfully delete the author when the destroy link is used" do
    author = FactoryGirl.create :author

    visit authors_path
    page.find_link('Destroy', href: author_path(author)).click

    expect(Author.where(id: author.id)).not_to be_present
  end

end
