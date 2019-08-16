# frozen_string_literal: true
# As a user
# So I can access my most visited websites
# I want to add a bookmark
feature 'add a bookmark' do
  scenario 'It should add a bookmark the list' do
    visit '/'
    click_button('Add')
    fill_in('title', with: 'Test Bookmark')
    fill_in('url', with: 'http://www.testbookmark.com')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end

# As a maker
# So I can make sure that the bookmarks work correctly
# I want the program to test if a url is valid
feature 'Validate url' do
  scenario 'Check if url is valid' do
    visit '/'
    click_button('Add')
    fill_in('title', with: 'Test Bookmark')
    fill_in('url', with: 'this is not a url')
    click_button('Submit')
    expect(page).not_to have_content('this is not a url')
    expect(page).to have_content('You must submit a VALID url')
  end
end
