Feature: Attempt to login without username/password and incorrect credentials

  Scenario Outline: Logins attempt
    Given I am on the login page
    And I fill in username with <usr>
    And I fill in password with <passwd>
    Then I should see the message <msg>

    Examples:
      |      usr     |      passwd      |         msg         |
      |              |       12         |    Need username    |
      |      user    |                  |    Need password    |
      | invalid_user | invalid_password | Invalid credentials |

  Scenario: Sign out attempt
    Given I am on the dashboard page
    And I click in SING OUT button
    Then I am on the login page
