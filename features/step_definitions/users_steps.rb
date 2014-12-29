require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should login page$/) do
  fill_in("user[email]",:with => "wolfwubang@gmail.com")
  fill_in("user[password]",:with => "12345678")
  click_button("Log in")
  #expect(page).to have_content(expceted_text)
end

Then(/^I should see "(.*?)" on the page$/) do |expceted_text|
  expect(page).to have_content(expceted_text)
end
