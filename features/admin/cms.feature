Feature: CMS
  In order to manage the ExtraSpecial Trust grant applications
  As an admin
  I want to have a cms
    
  Background:
    Given a user "administrator" exists with name: "Moises", account: "admin.istrator", email: "a@b.com", password: "secret1"
    And user "administrator" is logged in
    
    Given an application "grant_application1" exists with name_of_applicant: "Pedro Ximenez", address_of_applicant: "address", name_of_applicants_supporter: "app supportter", contact_details_of_supporter: "contact details", what_applicant_is_applying_for: "what he is applying for", relevant_information: "relevant, very", details_of_cost: "don't know yet", other_contributions: "nah", amount_requested_from_extra_special_trust: "a million dollars", registered_care_allowance: "true", supported_living_allowance: "true", domiciliary_allowance: "true", accepted_terms_and_conditions: "1/1/2010"

    Given an application "grant_application2" exists with name_of_applicant: "Parson", address_of_applicant: "address", name_of_applicants_supporter: "app supportter", contact_details_of_supporter: "contact details", what_applicant_is_applying_for: "what he is applying for", relevant_information: "relevant, very", details_of_cost: "don't know yet", other_contributions: "nah", amount_requested_from_extra_special_trust: "a million dollars", registered_care_allowance: "true", supported_living_allowance: "true", domiciliary_allowance: "true", accepted_terms_and_conditions: "1/1/2010"
    
  
  Scenario: I can see the list of grant applications
    When I go to the applications page
    # And show me the page
    # Then should see "grant 1"
    # And should see "grant 2"
    # And should see "grant 3"
