Feature: Create report on all domain listed in the database

  Scenario Outline:
    Given the database contains a tracked domain with the fqdn attribute set to "example.com"
    When the app is called with the flag : "<flag>"
    Then output should match the following regex ""

    Examples:
      | flag  |
      | -s     |
      | --show |