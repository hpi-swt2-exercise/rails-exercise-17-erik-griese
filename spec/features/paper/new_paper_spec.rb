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

  it "should save the paper when the user submitted one via the form" do
    visit new_paper_path

    title = "Breaking Time"
    venue = "Mgz"
    year = "2015"

    fill_in("paper_title", with: title)
    fill_in("paper_venue", with: venue)
    fill_in("paper_year", with: year)

    find('input[type="submit"]').click

    inserted_paper = Paper.find_by(title: title, venue: venue, year: year.to_i)
    expect(inserted_paper).not_to be_nil

    inserted_paper.destroy
  end

  it "should allow selecting 5 authors" do
    visit new_paper_path

    1.upto(5) do |i|
      expect(page).to have_field("Author #{i}")
    end
  end
  
end
