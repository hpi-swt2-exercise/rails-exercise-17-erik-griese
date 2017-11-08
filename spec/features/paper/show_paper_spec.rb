require 'rails_helper'

describe "Show paper page", type: :feature do
  
  it "Should show the paper title, venue and year" do
    paper = FactoryGirl.create :paper

    visit paper_path(paper)

    expect(page).to have_text(paper.title)
    expect(page).to have_text(paper.venue)
    expect(page).to have_text(paper.year.to_s)

    paper.destroy
  end
end
