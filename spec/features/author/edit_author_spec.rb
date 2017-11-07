require 'rails_helper'

describe "Edit author page", type: :feature do
  
  it "should render withour error" do
    author = FactoryGirl.create :author
    
    visit edit_author_path(author)
    
    author.destroy
  end

  it "should save changes to the author" do
    author = FactoryGirl.create :author

    updated_first_name = "Bob"
    updated_last_name ="Turner"
    updated_homepage = "www.bobby.de"

    visit edit_author_path(author)
    fill_in("author_first_name", with: updated_first_name)
    fill_in("author_last_name", with: updated_last_name)
    fill_in("author_homepage", with: updated_homepage)
    find('input[type="submit"]').click

    updated_author = Author.find(author.id)
    expect(updated_author.first_name).to eq(updated_first_name)
    expect(updated_author.last_name).to eq(updated_last_name)
    expect(updated_author.homepage).to eq(updated_homepage)

    updated_author.destroy
  end

end
