Feature: Zenoss Login
In order to Login in Zenoss we have to enter login details

	Scenario: Attempt to login without username
		Given I am on the Zenoss loginpage
		When enter with valid password
		Then error login shown
