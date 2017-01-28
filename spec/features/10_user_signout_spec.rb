feature '10. A user can sign out' do
  scenario 'When user clicks the button sign out message is displayed' do
    user_signup
    user_signin
    click_button('Sign out')
    expect(page).to have_text("Goodbye!")
  end
end
