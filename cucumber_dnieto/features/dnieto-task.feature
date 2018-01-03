Feature: Login Action

Scenario: Attempt to login with invalid credentials
	Given User navigate to Login Page
	When User enters Username and Password
	And User clicks Login button
	Then Error message is displayed 

Scenario: Attempt to login without username
	Given User navigate to Login Page
	And User enters Password
	And User clicks Login button
	Then Error message is displayed

Scenario: Attempt to login without password
	Given User navigate to Login Page
	And User enters Username
	And User clicks Login button
	Then Error message is displayed

Scenario: Add a Server Linux device and see the device on the Infrastructure list
	Given User navigate to Login Page
	When User enters Valid Username and Password
	And User clicks Login button
	And User clicks INFRASTRUCTURE tab
	And User clicks Add Device button
	And User clicks Add a Single Device button
	And User adds required fields in Add Single Device overlay
	Then User performs Logout process