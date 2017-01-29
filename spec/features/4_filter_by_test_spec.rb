 # As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag
feature '04. filter links by tag' do
  scenario 'filter by tag' do
    user_signup
    add_link_multiple_tags
    fill_in('tag_to_search', with: 'bubbles')
    click_button('Search')
    expect(page.status_code).to eq(200)
    within("ul#links") do
      expect(page).to have_text('bubbles')
    end
  end
end
