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

   feature 'user can filter tweets' do
     scenario 'adds same tag to multiple tweets which then filters by tag' do
       Chitter.create(url: "My first tweet")
       Chitter.create(url: "My second tweet")
       Chitter.create(url: "My third tweet")

       visit('/tweet')

       within page.find('.tweet:nth-of-type(1)') do
         click_button 'Add Tag'
       end
       fill_in 'tag', with: 'testing'
       click_button 'Submit'

       within page.find('.tweet:nth-of-type(2)') do
         click_button 'Add Tag'
       end
       fill_in 'tag', with: 'testing'
       click_button 'Submit'

       first('.tweet').click_link 'testing'

       expect(page).to have_content "My first tweet"
       expect(page).to have_content "My second tweet"
       expect(page).not_to have_content "My third tweet"
     end
   end
 end
