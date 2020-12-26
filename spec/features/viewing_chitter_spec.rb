require 'pg'

feature 'Viewing homepage' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Welcome to Chitter!'
    end
  end

   feature 'viewing tweets' do
     scenario 'tweets are visible' do
       Chitter.create(url: 'My first tweet')
       Chitter.create(url: 'My second tweet')
       visit '/tweet'

       expect(page).to have_content 'My first tweet'
       expect(page).to have_content 'My second tweet'
    end
  end
end
