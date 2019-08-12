require './lib/bookmark.rb'
describe Bookmark do
  let(:bookmark) {described_class.new}
  context '.all' do
  it 'Should return all bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end
end
