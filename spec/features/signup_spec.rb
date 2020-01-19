feature 'visits chitter homepage and signs up' do
  scenario 'returns "Welcome to Chitter!!!"' do
    visit('/chitter')
    click_button "Sign Up Here"
    expect(page).to have_content "Let's Sign You Up For Chitter!"
  end
end
