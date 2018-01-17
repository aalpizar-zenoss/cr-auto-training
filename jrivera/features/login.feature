Feature: Login and Logout Zenoss RM

  Background: pre steps
    Given I am on the login page

  Scenario: login with invalid credentials
    When I enter a valid username
    Then I enter an invalid password
    And I click on the login button
    Then I should see a message advising me the pass or user are incorrect


  Scenario Outline: Login empty fields
    When I fill in username with <usr>
    And I fill in password with <pass>
    Then I should see the message <msj>

    Examples:
    | usr       | pass      | msj               |
    | testuser  |           | Password missing  |
    |           | testpass  | Username missing  |

  Scenario: Logout from resmgr
    When I enter a valid username
    And I enter a valid password
    And I click on the login button
    Then I should see the Dashboard page
    And I logout the App
    Then I should see the Login Page

