# frozen_string_literal: true

feature 'Testing infrastructure' do
  scenario 'Greeting page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
