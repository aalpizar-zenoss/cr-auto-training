Feature: LDAP Active Directory

Scenario Outline: Add a LDAP Active Directory configuration
	
	Given User can access to Login Page
	Given User is logged with <username> and <password> as Admin user to ResMgr
	And User can access to ADVANCED options
	And User click button to add a new LDAP Configuration
	Given User add a LDAP server with the following values: 

		| host | managerdn | managerpsw |
		| test-win2008-ad.zenoss.loc | CN=Administrator,CN=Users,DC=zenoss-testing,dc=zenoss,dc=loc | D0gP0und! |

	Then User clicks Add LDAP Servers Next button
    And User add required values <usersbasedn> <groupsbasedn> <usefilter> <groupfilter>
	Then User clicks Configure LDAP Plugin Next button
	And User clicks Finish button

	Examples:
    	| username | password | usersbasedn | groupsbasedn | usefilter | groupfilter |
    	| admin | Zenoss22 | cn=users,dc=zenoss-testing,dc=zenoss,dc=loc | cn=users,dc=zenoss-testing,dc=zenoss,dc=loc | (cn=Organization.*) | (cn=IT Admins) |