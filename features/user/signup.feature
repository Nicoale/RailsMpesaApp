Feature: User Sign Up
As a User
I want  so sign up
So that i can have an account

Scenario: User successfully signup
Given I am on the signup page
Then I should see "First Name"
And I should see "Last Name"
And I should see "ID number"
And I should see "Phone Number"
And I should see "Password"
And I should see "Create Account" button
When I fill in "First Name" with "Jane"
And I fill in "Last Name" with "Doe"
And I fill in "ID Number" with "12345678"
And I fill in "Phone Number" with "070000000000"
And I fill in "Password" with "StrongerthanUsual"
And I click Create Account
Then I should see redirect to show page
And I should see "First Name: Jane"
And I should see "Last Name: Doe"
And I should see "ID Number: 12345678"
And I should see "Phone Number: 070000000000"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"