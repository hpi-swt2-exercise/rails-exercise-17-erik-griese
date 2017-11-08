FactoryGirl.define do
  factory :paper do
    paper_authors = FactoryGirl.build_list :author, 1
    title "COMPUTING MACHINERY AND INTELLIGENCE"
    venue "Mind 49: 433-460"
    year 1950
    authors paper_authors
  end
end
