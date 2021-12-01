Feature: Display a quote

  Scenario: Display a quotes
    Given the only citation the API will return is <input>
    When a quote is displayed
    Then the following text should be displayed <output>

  Example:
  | input | output |
  | {"anime":"[Anime]","character":"[Character]","quote"[Quote]"} | Anime: [Quote]\nCharacter: [Character]\n Quote: [Quote] |
  | {"anime":"[Anime]","character":"","quote"[Quote]"} | Anime: [Quote]\n Quote: [Quote] |