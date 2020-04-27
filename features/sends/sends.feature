Feature: User Send
As a User
I want  to send
So that can have a new send

Scenario: User successfully send
Given I am on the send page
Then I should see "Senders Phone Number"
And I should see "Receivers Phone NUmber"
And I should see "Amount"
And I should see "Balance"
And I should see "Pin"
And I should see "Create send" button
When I fill in "Senders Phone Number" with "0712345678"
And I fill in "Receivers Phone Number" with "012345456"
And I fill in "Pin" with "1234"
And I click Create send
Then I shoud be redirect to show page
And I should see "Senders Phone Number: 012345678"
And I should see "Receivers Phone Number: 012345456"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"