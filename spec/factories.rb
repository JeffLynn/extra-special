# JL 2013.07.04 Updated syntax
# JL 2013.07.19 getting error "Sequence already defined", so "used sequence directly on :name attribute"

require 'factory_girl'

TEST_IMAGE = File.open(File.join(Rails.root, "spec", "fixtures", "picture.png")) 

FactoryGirl.define do
#  sequence (:user_name) {|n| "John Doe#{n}"}
#  sequence (:user_email) {|n| "john.doe#{n}@ubxd.com"}
#  sequence (:user_account) { |n| "doe#{n}j"}

  factory :user do
    sequence (:name) {|n| "John Doe#{n}"}
    sequence (:email) {|n| "john.doe#{n}@ubxd.com"}
    sequence (:account) { |n| "doe#{n}j"}
    password      'password1'
  end

  factory :story do
    name          "Name"
    title         "Name's Story"
    body          "Lorem Ipsum"
    picture       TEST_IMAGE
  end

  factory :application do
    name_of_applicant                         "value for name_of_applicant"
    address_of_applicant                      "value for address_of_applicant"
    name_of_applicants_supporter              "value for name_of_applicants_supporter"
    contact_details_of_supporter              "value for contact_details_of_supporter"
    what_applicant_is_applying_for            "value for what_applicant_is_applying_for"
    relevant_information                      "value for relevant_information"
    details_of_cost                           "value for details_of_cost"
    other_contributions                       "value for other_contributions"
    amount_requested_from_extra_special_trust "value for amount_requested_from_extra_special_trust"
    registered_care_allowance                 false
    supported_living_allowance                true
    domiciliary_allowance                     false
    no_additional_funding                     "0"
    accepted_terms_and_conditions             {Time.now}
  end

  factory :link do
    ref           "http://www.example.com"
    text          "example.com"
  end
end

