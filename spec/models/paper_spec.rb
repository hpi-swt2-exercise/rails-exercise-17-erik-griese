require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should fail validation without a title" do
    paper_authors = FactoryGirl.build_list :author, 1
    paper = Paper.new(venue: "Mgz", year: 2017, authors: paper_authors)
    expect(paper).not_to be_valid
  end
end
