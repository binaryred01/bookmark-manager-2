require './app.rb'

RSpec.feature 'Testing bookmark', :type => :feature do

  scenario 'shows home page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'viewing bookmarks' do

    Bookmark.create(url:'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url:'http://www.destroyallsoftware.com', title: 'Destroy')
    Bookmark.create(url:'http://www.google.com', title: 'Google')

    visit '/bookmarks'
    
    expect(page).to have_content "Makers"
    expect(page).to have_content "Destroy"
    expect(page).to have_content "Google"
  end
end
