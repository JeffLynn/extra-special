require 'factory_girl'

TEST_IMAGE = File.open(File.join(Rails.root, "spec", "fixtures", "picture.png"))

Factory.sequence :user_name do |n|
  "John Doe#{n}"
end

Factory.sequence :user_email do |n|
  "john.doe#{n}@ubxd.com"
end

Factory.sequence :user_account do |n|
  "doe#{n}j"
end

Factory.define :user do |u|
  u.name          {Factory.next(:user_name)}
  u.email         {Factory.next(:user_email)}
  u.account       {Factory.next(:user_account)}
  u.password      'password1'
end

Factory.define :story do |s|
  s.name          "Name"
  s.title         "Name's Story"
  s.body          "Lorem Ipsum"
  s.picture       TEST_IMAGE
end

Factory.define :application do |a|
  a.name_of_applicant                         "value for name_of_applicant"
  a.address_of_applicant                      "value for address_of_applicant"
  a.name_of_applicants_supporter              "value for name_of_applicants_supporter"
  a.contact_details_of_supporter              "value for contact_details_of_supporter"
  a.what_applicant_is_applying_for            "value for what_applicant_is_applying_for"
  a.relevant_information                      "value for relevant_information"
  a.details_of_cost                           "value for details_of_cost"
  a.other_contributions                       "value for other_contributions"
  a.amount_requested_from_extra_special_trust "value for amount_requested_from_extra_special_trust"
  a.registered_care_allowance                 false
  a.supported_living_allowance                true
  a.domiciliary_allowance                     false
  a.accepted_terms_and_conditions             {Time.now}
end

Factory.define :link do |l|
  l.ref           "http://www.example.com"
  l.text          "example.com"
end

