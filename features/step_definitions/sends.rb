Given("I am on the send page") do
    visit 'send/new'
  end
  
  Then("I should see {string} button") do |string|
    expect (send).to_have_content create send
  end
  
  When("I click Create send") do
    click_button('Create send')
 end
  
  Then("I should see redirect to show page") do
    send = User.find_by(phone_number: '012345678')
    phone_number= send.phone_number
    visit "/send/#{phone_number}"
  end