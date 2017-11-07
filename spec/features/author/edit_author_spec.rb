require 'rails_helper'

describe "Edit author page", type: :feature do
  
  it "should render withour error" do
    author = FactoryGirl.create :author
    
    visit edit_author_path(author)
    
    author.destroy
  end

end
