feature 'Add bookmarks' do
  scenario 'user creates a new bookmark' do
    visit '/bookmarks/new'
    fill_in :bookmark_url, with: 'http://www.yahoo.com'
    fill_in :title, with: 'Yahoo'
    click_button 'Submit'
    expect(page).to have_content('Yahoo')
  end
end