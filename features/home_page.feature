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
      And I should see a link to favourites in the main navigation

      And I should see a link to the homepage in the footer
      And I should see a link to about us in the footer
      And I should see a link to what we do in the footer
      And I should see a link to stories in the footer
      And I should see a link to how you can help in the footer
      And I should see a link to how to apply in the footer
      And I should see a link to contact us in the footer
      And I should see a link to favourites in the footer

  Scenario: viewing the home page
    When I go to the homepage
    Then I should see the image "/images/homepage.png"

  Scenario: viewing the about us page
    When I go to the about us page
    Then I should see the image "/images/about_us.png"
    And I should see "A learning disability is the most common disability in Britain"

  Scenario: viewing the what we do page
    When I go to the what we do page
    Then I should see the image "/images/what_we_do.png"

  Scenario: viewing stories page
    When I go to the stories page
    #Then I should see the image "/images/rails.png"

  Scenario: viewing how you can help page
    When I go to the how you can help
    Then I should see the image "/images/how_you_can_help.png"

  Scenario: viewing the how to apply page
    When I go to the how to apply page
    Then I should see the image "/images/how_to_apply.jpg"

  Scenario: viewing the contact us page
    When I go to the contact us
    Then I should see the image "/images/contact_us.png"

  Scenario: viewing the favourites page
    Given a link "link_to_page1" exists with ref: "http://www.example1.com", text: "Example1", description: "example text1"
      And a link "link_to_page2" exists with ref: "http://www.example2.com", text: "Example2", description: "example text2"
    When I go to the favourites page
    Then I should see the image "/images/favourites.png"
      And I should see "Example1"
      And I should see "Example2"
      And I should see "example text1"
      And I should see "example text2"
      And I should see a link called "www.example1.com" linking to example page "1"
      And I should see a link called "www.example2.com" linking to example page "2"