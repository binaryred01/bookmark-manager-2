feature 'Add bookmarks' do
  scenario 'user creates a new bookmark' do
    visit '/bookmarks/new'
    fill_in :bookmark_url, with: 'http://www.yahoo.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.yahoo.com')
  end
end