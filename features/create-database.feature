Feature: The app should manage a database file

  Scenario: Create a database if it not exists
    Given there is no database file called "domain-observer.sqlite"
    When the application run
    Then there should be a database file called "domain-observer.sqlite"

  Scenario: Keep the existing data if it exists
    Given there is database file called "domain-observer.sqlite"
    And the database contains a tracked domain with the fqdn attribute set to "example.com"
    When the application run
    Then there should be a database file called "domain-observer.sqlite"
    And the database should contains a tracked domain with the fqdn attribute set to "example.com"