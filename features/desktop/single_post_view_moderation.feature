@javascript
  Feature: using SPV moderation buttons

  Background:
    Given following users exist:
      | username   |
      | bob        |
      | alice      |
    And I sign in as "bob@bob.bob"
    And a user with username "bob" is connected with "alice"
    And I am on the home page
  
  Scenario: hide a contact's post
    Given I expand the publisher
    When I write the status message "Here is a post to test with"
    And I submit the publisher

    And I log out
    And I sign in as "alice@alice.alice"
    
    And I open the show page of the "Here is a post to test with" post
    And I click to hide the post
    And I confirm the alert
    
    Then I should be on the stream page
  
  Scenario: block a contact
    Given I expand the publisher
    When I write the status message "Here is a post to test with"
    And I submit the publisher

    And I log out
    And I sign in as "alice@alice.alice"
    
    And I open the show page of the "Here is a post to test with" post
    And I click to block the user
    And I confirm the alert
    
    Then I should be on the stream page
    
  Scenario: report a contact
    Given I expand the publisher
    When I write the status message "Here is a post to test with"
    And I submit the publisher

    And I log out
    And I sign in as "alice@alice.alice"
    
    And I open the show page of the "Here is a post to test with" post
    And I click to report the post
    And I confirm the alert
    
    And I should see a flash message containing "The report was successfully created"
    
  Scenario: delete own post
    Given I expand the publisher
    When I write the status message "Here is a post to test with"
    And I submit the publisher

    And I open the show page of the "Here is a post to test with" post
    And I click to delete the post
    And I confirm the alert
    
    Then I should be on the stream page
    
    