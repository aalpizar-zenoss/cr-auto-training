Feature: Add LDAP configuration

  Background:
    Given I am logged in with admin user
    And I am on the Advance page

  Scenario: LDAP configuration
    When I click on LDAP left menu
    And I add a LDAP server with host "test-win2008-ad.zenoss.loc", manager DN "CN=Administrator,CN=Users,DC=zenoss-testing,dc=zenoss,dc=loc", manager PWD "D0gP0und!"
    And I configure the LDAP with users base DN "cn=users,dc=zenoss-testing,dc=zenoss,dc=loc", groups base DN "cn=users,dc=zenoss-testing,dc=zenoss,dc=loc"
    And I map the LDAP group "" with the role ""
    Then I should see the LDAP configuration with host "test-win2008-ad.zenoss.loc" and manager DN "CN=Administrator,CN=Users,DC=zenoss-testing,dc=zenoss,dc=loc"
