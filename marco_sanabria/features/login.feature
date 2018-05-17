Feature: Login Validations

  Background:
    Given I am at the login page

  Scenario Outline: Login attempts with wrong credentials
    When I enter username <username>
    And I enter password <password>
    Then I expect to see the message <message>

    Examples:
      |     username     |     password     | message |
      | invalid-username | invalid-password | Your session has expired or you have entered an incorrect username or password |
      |                  | ppapapapppapappa | Your session has expired or you have entered an incorrect username or password |
      | kdkkdkdkdkdkdkdk |                  | Your session has expired or you have entered an incorrect username or password |

  Scenario: Logout from resmgr
    When I successfully login
    And I then logout
    Then I expect to be back at the login page
