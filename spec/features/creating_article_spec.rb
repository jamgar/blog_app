require 'rails_helper'

RSpec.feature "Creating Articles" do
  
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "A user creates a new article" do #rspec
    visit "/" #capybara
    
    click_link "New Article" #capybara
    
    fill_in "Title", with: "Creating first article" #capybara 
    fill_in "Body", with: "This is the body of the first article" #capybara
    click_button "Create Article" #capybara
    
    expect(page).to have_content("Article has been created") #rspec
    expect(page.current_path).to eq(articles_path) #rspec
    expect(page).to have_content("Created by: #{@john.email}")
  end
  
  scenario "A user fails to create a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end