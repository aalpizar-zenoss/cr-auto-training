Feature: Login Action

Scenario: Attempt to login with invalid credentials
	Given User is on https://zenoss.zsd-master/
	When User navigate to Login Page
	And User enters Username and Password
	And User clicks Login button
	Then Error message is displayed 

Scenario: Attempt to login without username
	Given User is on https://zenoss5.zsd-master/
	When User navigate to Login Page
	And User leaves Username field empty
	And User enters Password
	And User clicks Login button
	Then Error message is displayed

Scenario: Attempt to login without password
	Given User is on https://zenoss5.zsd-master/
	When User navigate to Login Page
	And User enters Username
	And User leaves Password field empty
	And User clicks Login button
	Then Error message is displayed

Scenario: logout from resmgr
	Given User is successfully logged into https://zenoss.zsd-master/
	When User clicks Logout button on top of the website
	Then User is logged out from ResMgr