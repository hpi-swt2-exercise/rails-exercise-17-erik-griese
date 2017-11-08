require 'rails_helper'

RSpec.describe Paper, type: :model do

  it "should fail validation without a title" do
    paper_authors = FactoryGirl.build_list :author, 1
    paper = Paper.new(venue: "Mgz", year: 2017, authors: paper_authors)
    expect(paper).not_to be_valid
  end

  it "should fail validation without a venue" do
    paper_authors = FactoryGirl.build_list :author, 1
    paper = Paper.new(title: "Breaking Time", year: 2017, authors: paper_authors)
    expect(paper).not_to be_valid
  end

  it "should fail validation without a year" do
    paper_authors = FactoryGirl.build_list :author, 1
    paper = Paper.new(title: "Breaking Time", venue: "Mgz", authors: paper_authors)
    expect(paper).not_to be_valid
  end

  it "should fail validation with non-integer year" do
    paper_authors = FactoryGirl.build_list :author, 1
    paper = Paper.new(title: "Breaking Time", venue: "Mgz", year: "Sexteen", authors: paper_authors)
    expect(paper).not_to be_valid

    paper_float = Paper.new(title: "Breaking Time", venue: "Mgz", year: "2015.75", authors: paper_authors)
    expect(paper_float).not_to be_valid
  end

end
