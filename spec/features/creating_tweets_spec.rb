feature 'Adding a tweet' do
  scenario 'A user can add tweets' do
    visit('/tweet/new')
    fill_in('url', with: 'My third tweet')
    click_button('Submit')

    expect(page).to have_content('My third tweet')
  end
end
