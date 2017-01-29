# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager
feature '03.1 tag a link in bookmark manager' do
  scenario 'single tag a link' do
    user_signup
    add_link_single_tag
    first_link = Link.first
    expect(first_link.tags.map(&:name)).to include('social')
  end
end

# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager
feature '03.2 tag multiple links in bookmark manager' do
  scenario 'search social tag' do
    user_signup
    add_link_multiple_tags
    visit '/links'
    expect(page.status_code).to eq(200)
    within("ul#links") do
      expect(page).to have_text('social')
      expect(page).to have_text('bubbles')
    end
  end
end
