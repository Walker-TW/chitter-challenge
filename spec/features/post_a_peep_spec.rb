feature 'Inputs Peep and shows on page' do
  scenario 'Sign-Up and Be able to access the Post a Peep page' do
    visit('/chitter')
    click_button "Sign Up Here"
    fill_in :email, with: "fake@email.com"
    fill_in :username, with: "testusername"
    fill_in :realname, with: "nametest"
    fill_in :passwrd, with: "testpasswrd"
    click_button "Submit"
    click_button "Back to Chitter"
    click_button "Scream at Someone"
    expect(page).to have_content "Let's Post A Peep"
  end

  scenario 'Sign-Up and create a peep, display on all peeps page"' do
    visit('/chitter')
    click_button "Sign Up Here"
    fill_in :email, with: "fake@email.com"
    fill_in :username, with: "testusername"
    fill_in :realname, with: "nametest"
    fill_in :passwrd, with: "testpasswrd"
    click_button "Submit"
    click_button "Back to Chitter"
    click_button "Scream at Someone"
    fill_in :peep, with: "test peep"
    fill_in :user_id, with: "1"
    click_button "Submit"
    expect(page).to have_content "Welcome to Chitter!!!"
  end

  # scenario 'Sign-Up and create a peep, display on all peeps page"' do
  #   visit('/chitter')
  #   click_button "Sign Up Here"
  #   fill_in :email, with: "fake@email.com"
  #   fill_in :username, with: "testusername"
  #   fill_in :realname, with: "nametest"
  #   fill_in :passwrd, with: "testpasswrd"
  #   click_button "Submit"
  #   click_button "Back to Chitter"
  #   click_button "Scream at Someone"
  #   fill_in :peep, with: "test peep"
  #   fill_in :user_id, with: "1"
  #   click_button "Submit"
  #   visit('/chitter/view')
  #   expect(page).to have_content 'test peep'
  # end

  scenario 'Able to visit Peeps Display Page even if no peeps are there' do
    visit('/chitter')
    click_button "See Who's Peeping"
    expect(page).to have_content "Lets see whats Peepin'"
  end
end
