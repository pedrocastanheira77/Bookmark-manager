# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature '3.1 tag a link in bookmark manager' do
  scenario 'single tag a link' do
    visit '/links/new'
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tag, with: 'Social ')
    click_button('Save')
    first_link = Link.first
    expect(first_link.tags.map(&:name)).to include('Social')
  end
end

# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

feature '3.2 tag multiple links in bookmark manager' do
  scenario 'search social tag' do
    visit '/links/new'
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tag, with: 'social bubbles')
    click_button('Save')

    visit '/tags/social'
    expect(page.status_code).to eq(200)
    within("ul#links") do
      expect(page).to have_content('social')
      expect(page).to have_content('bubbles')
    end
  end
end
