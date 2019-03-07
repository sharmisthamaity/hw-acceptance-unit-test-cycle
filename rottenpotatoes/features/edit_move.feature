Feature: edit multiple movies in the database
 
  As a rotten potatoes database manager
  So that I can edit any movies that need to be updated
  I want to ensure the correct movie is updated accurately

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | R      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met George    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 15-Jun-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |
  
  Scenario: change title of movie
    When I go to the edit page for "When Harry Met George"
    And  I fill in "Title" with "When Harry Met Sally"
    And  I press "Update Movie Info"
    Then I should see "When Harry Met Sally"
    
  Scenario: change rating of movie
    When I go to the edit page for "Aladdin"
    And  I select "G" from "Rating"
    And  I press "Update Movie Info"
    Then the rating of "Aladdin" should be "G"
    
  Scenario: change date of movie
    When I go to the edit page for "Amelie"
    And  I select datetime "2001 April 25" from "movie_release_date" 
    And  I press "Update Movie Info"
    Then the release date of "Amelie" should be "April 25, 2001"