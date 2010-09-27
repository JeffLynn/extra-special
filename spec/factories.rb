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

