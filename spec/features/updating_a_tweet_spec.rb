feature 'Updating my tweet' do
  scenario ' A user can edit a tweet' do
    chitter = Chitter.create(url: 'My first tweet')
    visit('/tweet')
    expect(page).to have_content('My first tweet')

    first('.tweet').click_button 'Edit'
    expect(current_path).to eq "/tweet/#{chitter.id}/edit"
    fill_in('url', with: 'My fourth tweet')
    click_button('Submit')

    expect(current_path).to eq '/tweet'
    expect(page).not_to have_content('My first tweet')
    expect(page).to have_content('My fourth tweet')
  end
end
