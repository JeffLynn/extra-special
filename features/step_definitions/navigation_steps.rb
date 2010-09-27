Then /^I should (not |)see a link to (.*?) in (.*)$/ do |see_or_not, link_target, section_name|
  link_path = path_to(link_target)
  # this is so that if your link_text has ', xpath will still work
  xpath = "//a[@href=\"#{link_path}\"]"

  within(:xpath, xpath_of_section(section_name)) do
    if see_or_not.blank?
      page.should have_xpath(xpath)

    else
      page.should_not have_xpath(xpath)
    end
  end
end
