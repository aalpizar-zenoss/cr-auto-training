Feature: Zenoss Login
In order to Login in Zenoss we have to enter login details

	Scenario: Attempt to login without password
		Given I am on the Zenoss loginpage
		When enter with valid username
		Then error login shown
