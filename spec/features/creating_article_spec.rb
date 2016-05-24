require 'rails_helper'

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do #rspec
    visit "/" #capybara
    
    click_link "New Article" #capybara
    
    fill_in "Title", with: "Creating first article" #capybara 
    fill_in "Body", with: "This is the body of the first article" #capybara
    click_button "Create Article" #capybara
    
    expect(page).to have_content("Article has been created") #rspec
    expect(page.current_path).to eq(articles_path) #rspec
  end
end