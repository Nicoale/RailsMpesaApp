Feature: User withdrawal
As a User
I want  to withdraw
So that can have a New Withdarawal

Scenario: User successfully withdraws
Given I am on the withdrawal page
Then I should see "Phone Number"
And I should see "Agent Number"
And I should see "Amount"
And I should see "Pin"
And I should see "Create withdrawal" button
When I fill in "Phone Number" with "0712345678"
And I fill in "Agent Number" with "0123456"
And I fill in "Pin" with "1234"
And I click Create withdrawal
Then I should be redirect to show page
And I should see "Phone Number: 012345678"
And I should see "Agent Number:0123456"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"