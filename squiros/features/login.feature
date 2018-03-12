Feature: Zenoss Login
In order to Logout in Zenoss we have to click on SIGN OUT button

	Scenario: Logout from resmgr
		Given I am on the Zenoss page
		When I click on SIGN OUT button
		Then the loginpage is shown
