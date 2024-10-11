require 'selenium-webdriver'
require 'rspec'

date = Time.now.strftime("%Y-%m-%d-%H-%M-%S")

Given('I am on the LinkedIn homepage') do
#    visit 'https://www.google.com'
#    @profile_id = ENV['MYSITE']
    @profile_id = "www.linkedin.com"
    visit "https://#{@profile_id}"
end

Given('I am on the Dice homepage') do
#    visit 'https://www.google.com'
#    @profile_id = ENV['MYSITE']
    @profile_id = "www.dice.com"
    visit "https://#{@profile_id}"
end

Given('I am on the Dice login homepage') do
#    visit 'https://www.google.com'
#    @profile_id = ENV['MYSITE']
    @profile_id = "www.dice.com/dashboard/login"
    visit "https://#{@profile_id}"
end

When /^I enter "([^"]*)" in the Search window$/ do |search|
  fill_in 'APjFqb', :with => search
end

Then /^I should see "([^"]*)"$/ do |desc|
    expect(page).to have_content desc
end

Given("I am on the Google home page") do
  visit "https://www.google.com"
end

When("I enter {string} into the search field") do |search_term|
  fill_in "q", with: search_term # Google's search input name is "q"
end

When("I enter {string} into the email field") do |email|
  fill_in "email", with: email # Google's search input name is "q"
end

When("I enter {string} into the term search field") do |term|
  #fill_in (:id, "typeaheadInput"), with: term # Google's search input name is "q"
  page.find_by_id("typeaheadInput").fill_in?(term)
end

When("I enter {string} into the location search field") do |location|
  #fill_in (:id, "google-location-search"), with: location # Google's search input name is "q"
  page.find_by_id("google-location-search").fill_in?(location)
end

When("I fill in the password field") do
  pwd = ENV['DICE_PWD']
  fill_in "password", with: pwd # Google's search input name is "q"
end

When("I click the {string} button") do |button_name|
  find(:css, '.absolute').click
end

When("I click the location button") do
  find(:id, 'submitSearch-button').click
end

Then("I should see results related to {string}") do |expected_result|
  # Wait for the page to load and check that it includes the expected text.
  expect(page).to have_content(expected_result)
end
