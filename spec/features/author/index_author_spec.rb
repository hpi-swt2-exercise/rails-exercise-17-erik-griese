require 'rails_helper'

describe "Author index page", type: :feature do
  
  it "should render the author index page" do
    visit authors_path
  end

end
