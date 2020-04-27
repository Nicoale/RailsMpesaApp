Feature: User deposit
As a User
I want  to deposit
So that can have a new deposit

Scenario: User successfully deposit
Given I am on the deposit page
Then I should see "Phone Number"
And I should see "New deposit"
And I should see "Balance"
And I should see "Pin"
And I should see "Create deposit" button
When I fill in "Phone Number" with "0712345678"
And I fill in "New deposit" with "456"
And I fill in "Pin" with "1234"
And I click Create deposit
Then I shoud be redirect to show page
And I should see "Phone Number: 012345678"
And I should see "New deposit: 456"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"