feature 'Deleting a tweet' do
  scenario 'A user can delete a tweet' do
    Chitter.create(url: 'My third tweet')
    visit('/tweet')
    expect(page).to have_content('My third tweet')

    first('.chitter').click_button 'Delete'

    expect(current_path).to eq '/tweet'
    expect(page).not_to have_content('My third tweet')
  end
end
