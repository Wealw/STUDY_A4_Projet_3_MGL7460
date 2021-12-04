Feature: Delete a domain from the track list

  Scenario Outline: Database contains the described record
    Given the database contains a tracked domain with the fqdn attribute set to "example.com"
    When the app is called with the flag : "<flag> example.com"
    Then the database should contain no record

    Examples:
      | flag     |
      | -d       |
      | --delete |

  Scenario Outline: Database contains the described record
    Given the database contains no tracked domain
    When the app is called with the flag : "<flag> example.com"
    Then the return code of the script should be 26

    Examples:
      | flag     |
      | -d       |
      | --delete |
