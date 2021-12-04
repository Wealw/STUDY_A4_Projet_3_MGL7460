Feature: Add a domain in the track list

  Scenario Outline: Database is clean
    Given the database contains no tracked domain
    When the app is called with the flag : "<flag> example.com"
    Then the database should contain a record with the fqdn attribute set to "example.com"

    Examples:
      | flag  |
      | -a    |
      | --add |

  Scenario Outline: Database already contains a duplicate record
    Given the database contains a tracked domain with the fqdn attribute set to "example.com"
    When the app is called with the flag : "<flag> example.com"
    Then the return code of the script should be 26

    Examples:
      | flag  |
      | -a    |
      | --add |

