require 'rails_helper'

describe "Paper index page", type: :feature do

  it "should render without problems" do
    paper = FactoryGirl.create :paper

    visit papers_path

    paper.destroy
  end

  it "should display title, venue and year of all papers" do
    paper = FactoryGirl.create :paper
    visit papers_path

    expect(page).to have_text("Title")
    expect(page).to have_text(paper.title)
    
    expect(page).to have_text("Venue")
    expect(page).to have_text(paper.venue)

    expect(page).to have_text("Year")
    expect(page).to have_text(paper.year.to_s)

    paper.destroy
  end

end
