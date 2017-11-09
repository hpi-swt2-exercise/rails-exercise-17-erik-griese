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

  it "should have a link to the new paper page" do
    visit papers_path

    expect(page).to have_link("Add paper", href: new_paper_path)
  end

  it "should have a show, edit and destroy link" do
    paper = FactoryGirl.create :paper

    visit papers_path

    expect(page).to have_link("Show", href: paper_path(paper))
    expect(page).to have_link("Edit", href: edit_paper_path(paper))
    expect(page).to have_link("Destroy", href: paper_path(paper))

    paper.destroy
  end

  it "should successfully delete an author, when the destroy link is used" do
    paper = FactoryGirl.create :paper

    visit papers_path
    page.find_link("Destroy", href: paper_path(paper)).click

    expect(Paper.where(id: paper.id)).not_to be_present
  end

end
