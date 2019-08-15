# frozen_string_literal: true

# As a user
# So I can remove my bookmark from Bookmark Manager
# I want to delete a bookmark
feature 'delete a bookmark from bookmark manager' do
  scenario 'delete a bookmark from bookmark manager' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (id,title,url) VALUES (4, 'test4', 'http://www.makersacademy.com');")
    visit '/'
    click_button('Delete')
    fill_in('delete', with: 'test4')
    click_button('Delete')
    expect(page).not_to have_content 'test4'
  end
end
