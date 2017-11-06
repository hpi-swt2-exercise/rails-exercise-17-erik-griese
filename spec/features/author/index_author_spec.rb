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

    expect(page).to have_link("add author", href: new_author_path)
  end

end
