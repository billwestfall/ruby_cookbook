feature "Signing in" do

  scenario "Signing in with correct credentials" do
    visit 'https://www.google.com/'
    within("#session") do
      fill_in 'search', with: 'Success'
    end
    click_button 'Google Search'
    expect(page).to have_content 'Success'
  end
end
