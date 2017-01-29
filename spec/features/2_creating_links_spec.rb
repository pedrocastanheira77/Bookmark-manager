feature '02. Add a link' do
  scenario 'add the site address and title to my bookmark manager' do
    user_signup
    add_link_single_tag
    expect(page).to have_text('Facebook')
  end
end
