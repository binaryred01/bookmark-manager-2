require './lib/bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy', 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")

      expect(Bookmark.all).to include("Makers")
      expect(Bookmark.all).to include("Google")
      expect(Bookmark.all).to include("Destroy")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.yahoo.com', title: 'Yahoo')
      expect(Bookmark.all).to include('Yahoo')
    end
  end
end
