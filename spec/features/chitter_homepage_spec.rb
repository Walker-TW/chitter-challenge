feature 'visits chitter homepage' do
  scenario 'returns "Welcome to Chitter!!!"' do
    visit('/chitter')
    expect(page).to have_content "Welcome to Chitter!"
  end
end
