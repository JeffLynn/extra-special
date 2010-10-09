Then /^I should see the image "([^"]*)"$/ do |href|
  page.should have_xpath("//img[@src=\"#{href}\"]")
end

Then /^I should see a link called "([^\"]*)" linking to (.*?)$/ do |link_text, link_target|
  link_path = path_to(link_target)
  # this is so that if your link_text has ', xpath will still work
  xpath = "//a[@href='#{link_path}'][text()='#{link_text}']"

  page.should have_xpath(xpath)
end
