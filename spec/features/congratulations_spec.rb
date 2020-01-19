feature 'visits chitter homepage and signs up' do
  scenario 'returns "Welcome to Chitter!!!"' do
    visit('/chitter')
    click_button "Sign Up Here"
    fill_in :email, with: "fake@email.com"
    fill_in :username, with: "testusername"
    fill_in :realname, with: "nametest"
    fill_in :passwrd, with: "testpasswrd"
    click_button "Submit"
    expect(page).to have_content "Congratulations testusername you signed up for Chitter!"
  end
end
