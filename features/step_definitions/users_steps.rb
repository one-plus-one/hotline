require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Before do
  User.create(username: 'test', password: '123456', email: 'test@example.com')
end

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

And(/^I provide the username "(.*?)" and password$/) do |username|
  fill_in("user[username]",:with => username)
  fill_in("user[password]",:with => "123456")
end

When(/^I click login button$/) do
  click_button("登录")
end

Then(/^I should see "(.*?)" on the page$/) do |expceted_text|
  expect(page).to have_content(expceted_text)
end
