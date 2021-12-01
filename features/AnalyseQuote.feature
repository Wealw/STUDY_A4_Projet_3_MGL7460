Feature: Analyse stored quotes

  Scenario: Retrieve statistics from database
    Given the database contains the following quote : <input>
    When the analyse is run
    Then the printed output should be <output>

  Example:
  | input | output |
  | [{anime: "aA", character: "bA",citation: "cA" },{anime: "aA", character: "bA",citation: "cB" }] | "Number of quote: 2 \nUnique anime: 1 \nUnique character\nAverage size: 1 \n"|
  | [{anime: "aA", character: "bA",citation: "cA" },{anime: "aB", character: "bA",citation: "cB" }] | "Number of quote: 2 \nUnique anime: 2 \nUnique character\nAverage size: 2 \n"|
  | [] | "Number of quote: 0 \nUnique anime: 0 \nUnique character\nAverage size: 0 \n" |