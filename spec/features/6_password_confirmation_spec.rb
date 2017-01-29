feature '06. Password confirmation' do
  scenario 'password confirmation not matching password' do
    visit '/users/new'
    fill_in(:email, with: "jose@makers.com")
    fill_in(:password, with: "correct_password")
    fill_in(:password_confirmation, with: "wrong_password")
    click_button("Sign up")
    expect(page).to have_text("Password does not match the confirmation")
  end
end
