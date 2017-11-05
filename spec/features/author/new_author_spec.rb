require 'rails_helper'

describe "New author page", type: :feature do
  
  it "should render withour error" do
    visit 'authors/new'
  end
end
