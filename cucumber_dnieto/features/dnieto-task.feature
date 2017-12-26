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

Scenario: logout from resmgr
	Given User navigate to Login Page
	When User enters Valid Username and Password
	And User clicks Login button
	Given User performs Logout process