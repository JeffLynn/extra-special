Then /^I should see the image "([^"]*)"$/ do |href|
  page.should have_xpath("//img[@src=\"#{href}\"]")
end
