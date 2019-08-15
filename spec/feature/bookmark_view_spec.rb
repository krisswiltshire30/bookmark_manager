# frozen_string_literal: true

require './spec/database_helper.rb'

feature 'Testing bookmark route' do
  scenario 'user should be able to view bookmarks' do
    open_test_db
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
  end
end
