require 'rails_helper'

describe "New author page", type: :feature do
  
  it "should render withour error" do
    visit new_paper_path
  end

  it "should have fields for title, venue, year and a submit button" do
    visit new_paper_path

    expect(page).to have_field("Title")
    expect(page).to have_field("Venue")
    expect(page).to have_field("Year")

    expect(page).to have_css('input[type="submit"]')
  end
  
end
