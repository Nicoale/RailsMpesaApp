# frozen_string_literal: true

Given('I am on the withdrawal page') do
  visit 'withdarawal/new'
end

When('I click Create withdrawal') do
  expect withdrawal.to_have_content create withdrawal
end

Then('I should be redirect to show page') do
  withdrawal = User.find_by(phone_number: '012345678')
  phone_number = user.phone_number
  visit "/withdarawal/#{phone_number}"
end
