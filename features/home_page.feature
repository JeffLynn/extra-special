Feature: Homepage
  In order to see what Extra Special Trust is all about
  As a user
  I want to see the homepage

  Scenario: viewing the home page main menus
    When I go to the homepage
    Then I should see a link to the homepage in the main navigation
      And I should see a link to about us in the main navigation
      And I should see a link to what we do in the main navigation
      And I should see a link to stories in the main navigation
      And I should see a link to how you can help in the main navigation
      And I should see a link to how to apply in the main navigation
      And I should see a link to contact us in the main navigation
            
      And I should see a link to the homepage in the footer      
      And I should see a link to about us in the footer
      And I should see a link to what we do in the footer
      And I should see a link to stories in the footer
      And I should see a link to how you can help in the footer
      And I should see a link to how to apply in the footer
      And I should see a link to contact us in the footer
      
  Scenario: viewing the home page
    When I go to the homepage
    Then I should see the image "/images/rails.png"

  Scenario: viewing the about us page
    When I go to the about us page
    Then I should see the image "/images/rails.png"  
    And I should see "A learning disability is the most common disability in Britain"

  Scenario: viewing the what we do page
    When I go to the what we do page
    Then I should see the image "/images/rails.png"  

  Scenario: viewing stories page
    When I go to the stories page
    #Then I should see the image "/images/rails.png"
      
  Scenario: viewing how you can help page
    When I go to the how you can help
    Then I should see the image "/images/rails.png"

  Scenario: viewing the how to apply page
    When I go to the how to apply page
    Then I should see the image "/images/rails.png"

  Scenario: viewing the contact us page
    When I go to the contact us
    Then I should see the image "/images/rails.png"
      
      