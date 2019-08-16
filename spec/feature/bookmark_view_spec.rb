# frozen_string_literal: true

require './spec/database_helper.rb'
# As a user
# So I can see all my bookmarks
# I want to view my bookmarks
feature 'Testing bookmark route' do
  scenario 'user should be able to view bookmarks' do
    open_test_db
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
  end
end
