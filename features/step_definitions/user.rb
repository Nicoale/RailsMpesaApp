Given("I am on the signup page") do
    visit 'users/new'
  end
  
  Then("I should see {string}") do |string|
    expect (page).to_have_content first name
  end
  Then("I should see {string}") do |string|
    expect (page).to_have_content last name
  end
  Then("I should see {string}") do |string|
    expect (page).to_have_content ID number
  end
  Then("I should see {string}") do |string|
    expect (page).to_have_content phonenumber
  end
  Then("I should see {string}") do |string|
    expect (page).to_have_content Password
  end
  When("I fill in {string} with {string}") do |string,string2|
    fill_in string, with: string2
  end
  When("I fill in {string} with {string}") do |string,string2|
    fill_in string, with: string2 
  end
  When("I click Create Account") do
    click_button('Create Account')
  end
  
  Then("I shoud be redirect to show page") do
    user = User.find_by(id_number: '12345678')
    user_id = user.id
    visit "/users/#{user_id}"
  end
  