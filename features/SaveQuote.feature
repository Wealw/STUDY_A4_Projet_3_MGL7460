Feature: Save a quote

  Scenario: Default behavior
    Given the following quote <input>
    When a quote is trying to be inserted in the database
    Then the quote should appear only one time in the database

  Scenario: Quote is already in database
    Given the following quote <input>
    When a quote is trying to be inserted in the database
    But the quote is already in the database
    Then the quote should appear only one time in the database