require 'rails_helper'

describe "Author details page", type: :feature do
  
  it "should correctly render the author details page" do
    author = FactoryGirl.create :author
    visit author_path(author)
    author.destroy

  end
end
