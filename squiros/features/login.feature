Feature: Zenoss Login
In order to Login in Zenoss we have to enter login details

	Scenario: Attempt to login with invalid credentials
		Given I am on the Zenoss loginpage
		When enter with invalid username
		And enter with invalid password
		Then error login shown
