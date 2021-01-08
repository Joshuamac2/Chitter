feature 'Authentication' do
   scenario 'a user can sign in' do
     User.create(email: 'josh@live.com', password: 'password123')

     visit '/sessions/new'
     fill_in :email, with: 'josh@live.com'
     fill_in :password, with: 'password123'
     click_button('Sign in')

     expect(page).to have_content 'Welcome, josh@live.com'
   end

   scenario 'flass error if incorrect email' do
     User.create(email: 'josh@live.com', password: 'password123')

     visit '/sessions/new'
     fill_in(:email, with: 'test@example.com')
     fill_in(:password, with: 'password123')
     click_button('Sign in')

     expect(page).not_to have_content 'Welcome, josh@live.com'
     expect(page).to have_content 'Incorrect email or password'
   end

   scenario 'flass error if incorrect password' do
     User.create(email: 'josh@live.com', password: 'password123')

     visit '/sessions/new'
     fill_in(:email, with: 'josh@live.com')
     fill_in(:password, with: 'incorrect')
     click_button('Sign in')

     expect(page).not_to have_content 'Welcome, josh@live.com'
     expect(page).to have_content 'Incorrect email or password'
   end

   # scenario 'a user can sign out' do
   #   User.create(email: 'josh@live.com', password: 'password123')
   #
   #    visit '/sessions/new'
   #    fill_in(:email, with: 'josh@live.com')
   #    fill_in(:password, with: 'password123')
   #
   #    click_button('Sign in')
   #    click_button('Sign out')
   #
   #    expect(page).not_to have_content 'Welcome, josh@live.com'
   #    expect(page).to have_content 'Successfully signed out'
   #  end
 end
