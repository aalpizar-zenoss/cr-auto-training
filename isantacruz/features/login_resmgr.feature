Feature: This feature is to validate errors on the log in and log out system
  
Background:
Given I am in the log in of the resmgr system

Scenario: Attempt to login with invalid credentials
    When I input an username
    And I input a password
    And One of them is invalid
    And I click the "Log in" button
    Then An error message appears

Scenario: Attempt to login without username
    When I don't input an username
    And I input a password
    And I click the "Log in" button
    Then An error message appears
    
Scenario: Attempt to login without password
    When I input an username
    And I don't input a password
    And I click the "Log in" button
    Then An error message appears

Scenario: Logout from resmgr
    When I'm logged in
        When I input an username
        And I input a password
        And I click the "Log in" button
        Then I will redirected to the "Dashboard" page
    And I click the "Log out" button
    Then I will be redirected to the "Log in" page
      
    