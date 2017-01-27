# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature '4. filter links by tag' do
  before(:each) do
    Link.create(
    title: 'Facebook',
    url: 'www.facebook.com',
    tags: [Tag.first_or_create(name: "social")])
    Link.create(
    title: 'google',
    url: 'www.google.com',
    tags: [Tag.first_or_create(name: "bubbles")])
  end

  scenario 'filter by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within("ul#links") do
      expect(page).to have_content('bubbles')
      expect(page).not_to have_content('social')
    end
  end
end
