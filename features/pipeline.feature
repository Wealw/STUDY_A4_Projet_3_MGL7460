Feature: The operation should happens in the following order Add->Delete->Report

  Scenario Outline:
    When the app is called with the flag : "<flag>"
    Then output should match the following regex ""

    Examples:
      | flag                                                        |
      | -a example1.com -a example2.com -d example1.com -s          |
      | -add example1.com -add example2.com -delete example1.com -s |