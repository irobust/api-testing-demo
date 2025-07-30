@deckofcard
Feature: Test API Chaining

Background:
    * url baseURL
    * call read("authen.feature") { param1: "test"}
    * def requestBody = 
    """
    {
        "count": <count>
    }
    """

    Given path 'deck/new/shuffle'
    And params { deck_count: 1 }
    When method Get
    Then status 200
    And match response == { success: true, deck_id : '#string' , remaining: '#present', shuffled: true}
    * def deckId = response.deck_id

@smoke
Scenario: Draw a card

    Given path 'deck', deckId ,'draw'
    And params { count: 2 }
    When method Get
    Then status 200
    And match response contains {success: true, deck_id: '#(deckId)'}
    And match each response.cards contains { code: '#string', image: '#regex ^https.*' }

Scenario: Draw API should error when remaining less than count
    Given path 'deck', deckId, 'draw'
    And params { count : 53 }
    When method Get
    Then status 200
    And match response contains { error: '#present' }
    And match response.error contains 'Not enough cards remaining'


