date = Time.now.strftime("%Y-%m-%d-%H-%M-%S")

Given('I am on the Google homepage') do
#    visit 'https://www.google.com'
    @profile_id = ENV['MYSITE']
    visit "https://#{@profile_id}"
end

Then /^I should see "([^"]*)"$/ do |desc|
 debugger
 page.should have_content desc
end
