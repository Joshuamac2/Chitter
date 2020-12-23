feature 'View my chits' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content 'Hello World'
  end
end
