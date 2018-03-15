Feature: Zenoss Login
In order to Login in Zenoss we have to enter login details

	Scenario: Attempt to login with invalid credentials
		Given I am on the Zenoss loginpage
		When enter with invalid username:

		| username    |
		| admin1      |

		And enter with invalid password:

		| password    |
		| 1234567     |

		Then error login shown

	Scenario: Attempt to login without username
		Given I am on the Zenoss loginpage
		When enter with valid password:

		| password             |
		| sergioGQ89653890     |

		Then error login shown

	Scenario: Attempt to login without password
		Given I am on the Zenoss loginpage
		When enter with valid username:

		| username    |
		| admin       |

		Then error login shown

	Scenario: Logout from resmgr
		Given I am on the Zenoss loginpage
		Then enter with valid username and password:

		| password             |username    |
		| sergioGQ89653890     | admin      |

		Then I am on the Zenoss page
		When I click the SIGN OUT button
		Then the loginpage is shown
