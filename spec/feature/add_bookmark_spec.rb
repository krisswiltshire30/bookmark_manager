
feature 'add a bookmark' do
  scenario 'It should add a bookmark the list' do
    visit ('/')
    click_button('Add')
    fill_in('title', with: 'Test Bookmark')
    fill_in('url', with: 'http://www.testbookmark.com')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
