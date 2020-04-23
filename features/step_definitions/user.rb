Given("I am on the signup page") do
    visit 'users/new'# Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should see {firstname}") do |string|
    expect (page).to_have_content first name# Write code here that turns the phrase above into concrete actions
  end
  Then("I should see {lastname}") do |string|
    expect (page).to_have_content last name# Write code here that turns the phrase above into concrete actions
  end
  Then("I should see {ID number}") do |string|
    expect (page).to_have_content ID number# Write code here that turns the phrase above into concrete actions
  end
  Then("I should see {phonenumber}") do |string|
    expect (page).to_have_content phonenumber# Write code here that turns the phrase above into concrete actions
  end
  Then("I should see {Password}") do |string|
    expect (page).to_have_content Password# Write code here that turns the phrase above into concrete actions
  end
  When("I fill in {firstname} with {John}") do |string,string2|
    fill_in firstname, with: John # Write code here that turns the phrase above into concrete actions
  end
  When("I fill in {lastname} with {Doe}") do |string,string2|
    fill_in lastname, with: Doe # Write code here that turns the phrase above into concrete actions
  end
  When("I click Create Account") do
    click_button('Create Account')
  end
  
  Then("I shoud be redirect to show page") do
    user = User.find_by(id_number: '12345678')
    user_id = user.id
    visit "/users/#{user_id}"
  end
  