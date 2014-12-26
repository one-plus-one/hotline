require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)" on the page$/) do |expceted_text|
  expect(page).to have_content(expceted_text)
end