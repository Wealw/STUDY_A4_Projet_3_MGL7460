Feature: Main menu

  Scenario: Default behavior
    Given the application has started
    When the application runs
    Then the printed output should be "Welcome to AnimeCitation !\n1)Pull a new citation\n2) Display all quotes\n3) Delete a quote\n4)Get stats"
