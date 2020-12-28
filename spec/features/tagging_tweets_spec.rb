feature 'Adding and viewing tags' do
   feature 'a user can add and then view a tag' do
     scenario 'a comment is added to a tweet' do
       chitter = Chitter.create(url: 'My first tweet')

       visit '/tweet'
       first('.tweet').click_button 'Add Tag'

       expect(current_path).to eq "/tweet/#{chitter.id}/tags/new"

       fill_in 'tag', with: 'test tag'
       click_button 'Submit'

       expect(current_path).to eq '/tweet'
       expect(first('.tweet')).to have_content 'test tag'
     end
   end
 end
