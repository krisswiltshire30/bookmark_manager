
feature 'add a bookmark' do
  scenario 'It should add a bookmark the list' do
    visit '/'
    fill_in('url', with: 'http://www.isitchristmasyet.com')
    click_button('Submit')
    expect(page).to have_content 'http://www.isitchristmasyet.com'
  end
end
