feature 'Adding and viewing comments' do
  feature 'a user can add and view comments' do
    scenario 'a comment is added to a tweet' do
      chitter = Chitter.create(url: 'My first tweet')

      visit '/tweet'
      first('.tweet').click_button 'Add comment'

      expect(current_path).to eq "/tweet/#{chitter.id}/comments/new"

      fill_in 'comment', with: 'Test comment'
      click_button 'Submit'

      expect(current_path).to eq '/tweet'
      expect(first('.tweet')).to have_content 'Test comment'
    end
  end
end
