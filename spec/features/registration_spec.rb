feature 'registration' do
  scenario 'user sign up' do
    visit '/users/new'
    fill_in('email', with: 'josh@live.com')
    fill_in('password', with: 'joshmac')
    click_button('Submit')

    expect(page).to have_content "Welcome, josh@live.com"
  end
end
