# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature '3. tag links in bookmark manager' do
  scenario 'tag a link' do
    visit '/links/new'
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tag, with: 'Social')
    click_button('Save')
    first_link = Link.first
    expect(first_link.tags.map(&:name)).to include('Social')
  end
end
