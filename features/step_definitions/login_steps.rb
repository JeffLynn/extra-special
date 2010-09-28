include AuthenticatedTestHelper

Given /^#{capture_model} is logged in$/ do |user_name|
  login_as(User.new(:account => 'admin'))
  # user = model(user_name)
  # login_as(user)
end
