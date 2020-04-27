
Given("I am on the deposit page") do
    visit 'deposit/new'
  end
  
  Then("I should see {string} button") do |string|
    expect (deposit).to_have_content create deposit
  end
  
  When("I click Create deposit") do
    click_button('Create deposit')
 end
  
  Then("I should see redirect to show page") do
    deposit = User.find_by(phone_number: '012345678')
    phone_number= user.phone_number
    visit "/deposits/#{phone_number}"
  end