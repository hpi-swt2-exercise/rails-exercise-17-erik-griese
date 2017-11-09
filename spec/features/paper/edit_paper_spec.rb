require 'rails_helper'

describe "Edit paper page", type: :feature do

  it "should render" do
    paper = FactoryGirl.create :paper

    visit edit_paper_path(paper)

    paper.destroy
  end

  it "should save changes" do
    paper = FactoryGirl.create :paper

    visit edit_paper_path(paper)

    title = "Updated Title"
    venue = "Updated Venue"
    year = "2020"

    fill_in("Title", with: title)
    fill_in("Venue", with: venue)
    fill_in("Year", with: year)

    find('input[type="submit"]').click

    updated_paper = Paper.find(paper.id)

    expect(updated_paper.title).to eq(title)
    expect(updated_paper.venue).to eq(venue)
    expect(updated_paper.year.to_s).to eq(year)

    updated_paper.destroy
  end

  it "should allow selecting 5 authors" do
    paper = FactoryGirl.create :paper

    visit edit_paper_path(paper)

    1.upto(5) do |i|
      expect(page).to have_field("Author #{i}")
    end

    paper.destroy
  end

  it "should save changes to the author list" do
    paper = FactoryGirl.create :paper

    new_author = Author.create(first_name: 'Peter', last_name: 'Plago')

    visit edit_paper_path(paper)

    find_field("paper_author_id_1").find("option[value=\"#{new_author.id}\"]").select_option
    find('input[type="submit"]').click

    updated_paper = Paper.find(paper.id)
    expect(updated_paper.author_ids.first).to eq(new_author.id)

    updated_paper.destroy
	new_author.destroy
  end


end
