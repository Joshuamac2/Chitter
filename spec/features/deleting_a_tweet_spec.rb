feature 'Deleting a tweet' do
  scenario 'A user can delete a tweet' do
    Chitter.create(url: 'My third tweet')
    visit('/tweet')
    expect(page).to have_content('My third tweet')

    first('.tweet').click_button 'Delete'
    # .chitter is refering to @chitter in views?


    expect(current_path).to eq '/tweet'
    expect(page).not_to have_content('My third tweet')
  end
end
