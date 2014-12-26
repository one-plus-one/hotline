Feature: Contact me
    In order to get in touch
    A visitor
    Should send me a message by contact form
 
    Scenario: Sends a contact message
        Given I am on the users page
        Then I should see "Listing users" on the page
        