require './lib/bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(Bookmark.all).to include("http://www.makersacademy.com")
      expect(Bookmark.all).to include("http://www.google.com")
      expect(Bookmark.all).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.yahoo.com')
      expect(Bookmark.all).to include('http://www.yahoo.com')
    end
  end
end
