# frozen_string_literal: true

require './lib/bookmark.rb'
describe Bookmark do
  # let(:bookmark) { described_class.new }
  context '.all' do
    it 'Should return all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.add(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
      Bookmark.add(title: 'Google', url: 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
end
