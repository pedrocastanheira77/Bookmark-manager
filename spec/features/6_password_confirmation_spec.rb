feature '6. Password confirmation' do
  scenario 'password confirmation not matching password' do
    visit '/users/new'
    fill_in(:email, with: 'lauren@makers.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1235')
    click_button 'Sign up'
    # expect(current_path).to eq '/users'
    expect(page).to have_text("Password does not match the confirmation")
  end

end
