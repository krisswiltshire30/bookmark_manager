# frozen_string_literal: true

# As a user
# So I can change a bookmark in Bookmark Manager
# I want to update a bookmark
feature 'Update a bookmark' do
  scenario 'Update a bookmarks url with bookmark manager' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (id,title,url) VALUES (5, 'test5', 'http://www.makersacademy.com');")
    visit '/'
    click_button('Update')
    fill_in('title1', with: 'test5')
    fill_in('update_url', with: 'http://www.google.com')
    click_button('Update url')
    expect(page).to have_link('test5', href: 'http://www.google.com')
  end

  scenario 'Update a bookmarks title with bookmark manager' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (id,title,url) VALUES (6, 'test6', 'http://www.makersacademy.com');")
    visit '/'
    click_button('Update')
    fill_in('title2', with: 'test6')
    fill_in('new_title', with: 'a_new_title')
    click_button('Update title')
    expect(page).not_to have_content 'test6'
    expect(page).to have_content 'a_new_title'
  end
end
